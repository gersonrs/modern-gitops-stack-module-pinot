locals {
  domain      = format("pinot.%s", trimprefix("${var.subdomain}.${var.base_domain}", "."))
  domain_full = format("pinot.%s.%s", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain)

  helm_values = [{
    pinot = {
      # Istio ambient mode tunnels mesh traffic between pods over HBONE on
      # port 15008. NetworkPolicy is enforced on the host (outside the pod), so
      # the bundled ZooKeeper policy, which only allows 2181/2888/3888, drops
      # the tunnelled connection before it reaches the pod and every Pinot
      # component fails with ZkTimeoutException.
      # See: https://istio.io/latest/docs/ambient/usage/networkpolicy/
      # Broker and minion start a JVM and join the Helix cluster before they
      # answer /health. The chart defaults (60s initial delay, 10 failures x 10s)
      # are not enough on a loaded kind node and kubelet SIGTERMs the pod
      # mid-startup, so give them room to come up.
      broker = {
        probes = {
          liveness = {
            initialDelaySeconds = 180
            failureThreshold    = 20
            periodSeconds       = 20
          }
          readiness = {
            initialDelaySeconds = 180
            failureThreshold    = 20
            periodSeconds       = 20
          }
        }
      }
      minion = {
        probes = {
          liveness = {
            initialDelaySeconds = 180
            failureThreshold    = 20
            periodSeconds       = 20
          }
          readiness = {
            initialDelaySeconds = 180
            failureThreshold    = 20
            periodSeconds       = 20
          }
        }
      }
      zookeeper = {
        networkPolicy = {
          extraIngress = [
            {
              ports = [
                { port = 15008, protocol = "TCP" }
              ]
            }
          ]
        }
      }
      controller = {
        # Exposure is handled by the HTTPRoute below, served by the Istio
        # gateway, so the chart's own Ingress stays disabled.
        ingress = {
          v1 = {
            enabled : false
          }
        }
        # extra = {
        #   configs = <<-EOT
        #     pinot.set.instance.id.to.hostname=true
        #     controller.task.scheduler.enabled=true
        #     pinot.set.instance.id.to.hostname=true
        #     pinot.controller.storage.factory.class.s3=org.apache.pinot.plugin.filesystem.S3PinotFS
        #     pinot.controller.storage.factory.s3.endpoint=http://${var.storage.endpoint}/${var.storage.bucket_name}/segment-store/
        #     pinot.controller.storage.factory.s3.region=eu-west-1
        #     pinot.controller.storage.factory.s3.accessKey=${var.storage.access_key}
        #     pinot.controller.storage.factory.s3.secretKey=${var.storage.secret_access_key}
        #     pinot.controller.segment.fetcher.protocols=file,http,s3
        #     pinot.controller.segment.fetcher.s3.class=org.apache.pinot.common.utils.fetcher.PinotFSSegmentFetcher
        #     controller.local.temp.dir=/tmp/pinot-tmp-data/
        #   EOT
        # }
      }
      # server = {
      #   extra = {
      #     configs = <<-EOT
      #       pinot.set.instance.id.to.hostname=true
      #       pinot.server.instance.realtime.alloc.offheap=true
      #       pinot.query.server.port=7321
      #       pinot.query.runner.port=7732
      #       pinot.server.instance.realtime.alloc.offheap=true
      #       pinot.server.instance.currentDataTableVersion=2
      #       pinot.server.storage.factory.class.s3=org.apache.pinot.plugin.filesystem.S3PinotFS
      #       pinot.server.storage.factory.s3.endpoint=http://${var.storage.endpoint}/${var.storage.bucket_name}/segment-store/
      #       pinot.server.storage.factory.s3.region=eu-west-1
      #       pinot.server.storage.factory.s3.accessKey=${var.storage.access_key}
      #       pinot.server.storage.factory.s3.secretKey=${var.storage.secret_access_key}
      #       pinot.server.segment.fetcher.protocols=file,http,s3
      #       pinot.server.segment.fetcher.s3.class=org.apache.pinot.common.utils.fetcher.PinotFSSegmentFetcher
      #     EOT
      #   }
      # }
    }
  }]

  helm_values_httproute = [{
    httproute = {
      enabled           = true
      host              = local.domain
      gateway_name      = var.gateway_name
      gateway_namespace = var.gateway_namespace
    }
  }]
}