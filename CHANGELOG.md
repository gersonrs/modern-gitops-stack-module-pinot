# Changelog

## [2.0.3](https://github.com/gersonrs/modern-gitops-stack-module-pinot/compare/v2.0.2...v2.0.3) (2026-11-21)


### 🔥 Bug Fixes

* give broker and minion time to start before probes fail ([#12](https://github.com/gersonrs/modern-gitops-stack-module-pinot/issues/12)) ([3947902](https://github.com/gersonrs/modern-gitops-stack-module-pinot/commit/3947902bd2fa00c894118ea0286809a379f58513))

## [2.0.2](https://github.com/gersonrs/modern-gitops-stack-module-pinot/compare/v2.0.1...v2.0.2) (2026-11-21)


### 🔥 Bug Fixes

* open HBONE port on the bundled ZooKeeper policy ([#10](https://github.com/gersonrs/modern-gitops-stack-module-pinot/issues/10)) ([56d96d5](https://github.com/gersonrs/modern-gitops-stack-module-pinot/commit/56d96d5ff66d14cd997467038ae4edef7ff3d632))

## [2.0.1](https://github.com/gersonrs/modern-gitops-stack-module-pinot/compare/v2.0.0...v2.0.1) (2026-11-20)


### 🔥 Bug Fixes

* use kubernetes_service_v1 data source ([#8](https://github.com/gersonrs/modern-gitops-stack-module-pinot/issues/8)) ([4dbfced](https://github.com/gersonrs/modern-gitops-stack-module-pinot/commit/4dbfcede3399f617aad73a914fd2b93f198bc21b))

## [2.0.0](https://github.com/gersonrs/modern-gitops-stack-module-pinot/compare/v1.1.1...v2.0.0) (2026-11-20)


### ⚠ BREAKING CHANGES

* provider major bumps and a stricter Terraform baseline; consumers must run `terraform init -upgrade`.

### 🚀 New Features

* add namespace_labels variable to all modules ([657b49f](https://github.com/gersonrs/modern-gitops-stack-module-pinot/commit/657b49f1687c7cf4b5f680883d840228d8249aca))
* upgrade charts, providers and Terraform baseline ([#5](https://github.com/gersonrs/modern-gitops-stack-module-pinot/issues/5)) ([a0b4cbb](https://github.com/gersonrs/modern-gitops-stack-module-pinot/commit/a0b4cbb29f8a6236c550ef23a80e432c38f6c4f8))


### 📦 CI Improvements

* run release-please with GITHUB_TOKEN ([#6](https://github.com/gersonrs/modern-gitops-stack-module-pinot/issues/6)) ([7b8f20f](https://github.com/gersonrs/modern-gitops-stack-module-pinot/commit/7b8f20f8c5f73579a0d445c230ecc441f228ffe1))

## [1.1.1](https://github.com/GersonRS/modern-gitops-stack-module-pinot/compare/v1.1.0...v1.1.1) (2025-02-08)


### ⌨️ Code Refactoring

* adjust workflows ([d967971](https://github.com/GersonRS/modern-gitops-stack-module-pinot/commit/d9679718cda64973ee06a28ad79da4841ebb6412))
* try adjust code 5 ([3d94e9c](https://github.com/GersonRS/modern-gitops-stack-module-pinot/commit/3d94e9c0eb3b2ec5fe807e6591ea2a4184fdde6b))

## [1.1.0](https://github.com/GersonRS/modern-gitops-stack-module-pinot/compare/v1.0.0...v1.1.0) (2024-08-19)


### 🚀 New Features

* adjust repo ([6d35533](https://github.com/GersonRS/modern-gitops-stack-module-pinot/commit/6d3553391c27ea025fcecd97981b430aee4a8e1f))


### 📚 Documentation

* **terraform-docs:** generate docs and write to README.adoc ([8c550d0](https://github.com/GersonRS/modern-gitops-stack-module-pinot/commit/8c550d061026cb0764bdf6e4c83791bed01cdabc))
