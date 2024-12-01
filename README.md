# Helm Charts

> High Quality™ [Helm](https://helm.sh) charts 

[![Build Status](https://github.com/LeoColomb/charts/actions/workflows/ci.yml/badge.svg)](https://github.com/LeoColomb/charts/actions/workflows/ci.yml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/leocolomb)](https://artifacthub.io/packages/search?repo=leocolomb)

## About

This Git repository houses the Helm charts for diverse applications.

|               Chart               |                                                                                                           Version                                                                                                            |
| :-------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| [`leocolomb/cisco-nso`](charts/cisco-nso/) | [![Chart Version](https://img.shields.io/badge/dynamic/json?label=cisco-nso&query=version&url=https%3A%2F%2Fartifacthub.io%2Fapi%2Fv1%2Fpackages%2Fhelm%2Fleocolomb%2Fcisco-nso)](https://artifacthub.io/packages/helm/leocolomb/cisco-nso) |

## Quickstart

```shell
helm install my-release oci://ghcr.io/leocolomb/charts/<chart>
```

See docs on your preferred sources:

- [Charts docs on Artifact Hub](https://artifacthub.io/packages/search?org=leocolomb)
- [Charts respective readmes](charts)
- [Charts discovery](https://helm.sh/docs/helm/helm_search/)
  ```sh
  helm search hub leocolomb
  ```
- [Charts repository](https://helm.sh/docs/helm/helm_repo/)
  ```sh
  helm repo add leocolomb https://leocolomb.github.io/charts/
  ```

## License

This project is licensed under [MIT License](LICENSE-MIT).

The Helm charts distributed from within this repository are licensed under [Apache License, Version 2.0](LICENSE-APACHE) unless specific otherwise by the respective  chart.

The application mentioned by the Helm charts distributed from within this repository are licensed under their respective license.
