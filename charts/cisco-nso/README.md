# Cisco Network Services Orchestrator (NSO)

> Helm Chart for Cisco Network Services Orchestrator (NSO)

## About

This chart installs [Cisco Network Services Orchestrator (NSO)](https://www.cisco.com/c/en/us/products/cloud-systems-management/network-services-orchestrator/index.html)
on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Deploying Cisco NSO on Kubernetes offers numerous advantages, including consistent deployments, self-healing capabilities, and better version control.  
This Helm chart enforces [best practices for deploying NSO on Kubernetes](https://developer.cisco.com/docs/nso/deploying-cisco-nso-on-kubernetes/) to ensure optimal performance, security, and maintainability.

## Prerequisites

- Kubernetes [1.23+](https://kubernetes.io/releases/)
- Cisco Network Services Orchestrator (NSO) Container Image [6.1+](https://www.cisco.com/c/en/us/products/collateral/cloud-systems-management/network-services-orchestrator/bulletin-c25-742437.html)

> [!warning]
>
> **Cisco Network Services Orchestrator (NSO) software is not distributed by this Helm chart.**
>
> Cisco Network Services Orchestrator (NSO) container image must be provided by the user of the chart,
> based or built on top of the official NSO Docker Image distributed by Cisco Systems, Inc.  
> The following value must be used to setup the image reference: `image.repository`.

## Usage

This chart expects to be manage as a standard [Helm chart](https://helm.sh/docs/topics/charts/).
All the commands from the [Helm CLI](https://helm.sh/docs/helm/) apply.

```console
helm install cisco-nso oci://ghcr.io/leocolomb/charts/cisco-nso
```

## License

This project is licensed under [Apache License, Version 2.0](LICENSE).

Cisco Network Services Orchestrator (NSO) and Tail-f Network Control System (NCS) are Copyright (c) Cisco Systems, Inc.
