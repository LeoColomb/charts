# RIPE Atlas

> Helm Chart for RIPE Atlas

## About

This chart installs [RIPE Atlas](https://www.ripe.net/ripe-atlas)
on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes [1.23+](https://kubernetes.io/releases/)
- RIPE Atlas Container Image [5120+](https://github.com/RIPE-NCC/ripe-atlas-software-probe/releases)

> [!warning]
>
> **RIPE Atlas software is not distributed by this Helm chart.**
>
> RIPE Atlas container image must be provided by the user of the chart,
> based or built on top of the official RIPE Atlas distributed by RIPE NCC.  

## Usage

This chart expects to be manage as a standard [Helm chart](https://helm.sh/docs/topics/charts/).
All the commands from the [Helm CLI](https://helm.sh/docs/helm/) apply.

```console
helm install ripe-atlas oci://ghcr.io/leocolomb/charts/ripe-atlas
```

## License

This project is licensed under [GNU General Public License, Version 3.0](LICENSE).

RIPE Atlas is Copyright (c) RIPE NCC.
