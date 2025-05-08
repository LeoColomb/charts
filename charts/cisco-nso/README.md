# Cisco Network Services Orchestrator (NSO)

> Helm Chart for Cisco Network Services Orchestrator (NSO)

## About

This chart installs [Cisco Network Services Orchestrator (NSO)](https://www.cisco.com/go/nso)
on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Deploying Cisco NSO on Kubernetes offers numerous advantages, including consistent deployments, self-healing capabilities, and better version control.  
This Helm chart enforces [best practices for deploying NSO on Kubernetes](https://nso-docs.cisco.com/resources/best-practices/nso-on-kubernetes) to ensure optimal performance, security, and maintainability.

## Features

### Deployment Architecture

- **Isolation**: Runs NSO in its own namespace to isolate its resources (pods, services, secrets, and so on.) from other applications and services in the cluster. This logical separation helps manage resources and apply specific RBAC policies.
- **Stateful Pods**: Uses StatefulSets for production deployments to ensure that each NSO pod retains its data across restarts by mounting the same PersistentVolume. StatefulSets also provide a stable network identity for each pod.
- **Data Persistence**: Used PersistentVolumeClaims to manage storage and ensure that critical directories like NSO running directory, packages directory, and logs directory persist through restarts.
- **Ingress Controllers**: Uses Ingress for managing external access to HTTP or HTTPS traffic.
- **ConfigMaps and Secrets**: Uses ConfigMaps for non-sensitive configuration files and Secrets for sensitive data like Docker registry credentials. ConfigMaps are used to manage NSO configuration files, while Secrets can store sensitive information such as passwords and API keys. In NSO, the sensitive data that should go into Secrets is, for example, encryption keys for the CDB.
- **Simplified Deployment**: Uses Helm charts for packaging YAML manifests, simplifying the deployment process. Manages deployment parameters through a `values.yaml` file.
- **Custom Configuration**: Exposes runtime parameters, service ports, URLs, and other configurations via Helm templates. Helm charts allow for more dynamic and reusable configurations.

### Security Considerations

- **SecurityContext**: Limits the Linux capabilities that are allowed for the NSO container and ensures NSO runs as a dedicated user. This can help in adhering to the principle of least privilege. (Requires a custom container image with proper user configuration)
- **Ingress and Egress Control**: Implements NetworkPolicies to restrict access to NSO instances and managed devices. Limits the communication to trusted IP ranges and namespaces.
- **Service Accounts**: Creates dedicated service accounts for NSO pods to minimize permissions and reduce security risks. This ensures that each service account only has the permissions it needs for its tasks.

### Monitoring & Logging

<!-- - **Observability Exporter**: Exports data in industry-standard formats such as OpenTelemetry. (Requires observability exporter package) -->

- **Container Probes**: Implements probes to monitor the health and readiness of NSO containers. Uses HTTP checks to ensure that the NSO API is operational. Probes can help in ensuring that the application is functioning correctly and can handle traffic.
- **Logs Rotation**: Implements volumes and sidecar containers to properly rotate logs. This helps to use any standard log forwarder.

### Scaling & Performance Optimization

- **Resource Management**: Defines resource requests and limits for NSO pods to ensure appropriate CPU and memory allocation. This helps maintain cluster stability and performance by preventing any single pod from using excessive resources.
- **Pod Distribution**: Uses affinity and anti-affinity rules to ensure optimal distribution of NSO pods across worker nodes. This helps in achieving high availability and resilience by ensuring that pods are evenly distributed across nodes.

### High Availability & Resiliency

- **Raft High Availability**: Configures a three-node Raft cluster for high availability. Ensures that each node has a unique pod and network identity, as well as its own PersistentVolume and PersistentVolumeClaim.
- **Service Annotations**: Uses annotations to direct requests to the primary NSO instance. Implements sidecar containers to periodically check and update the Raft HA status. This ensures that the primary instance is always up and running.

### Backup & Disaster Recovery

- **Automated Backups**: Uses CronJobs to automate regular NSO backups.
- **Disaster Recovery**: Uses temporary initial container instances to restore backups without running NSO.

### Upgrade & Maintenance

- **Persistent Storage**: Ensures sthat the NSO running directory uses persistent storage to maintain data integrity during upgrades.
- **Testing**: Tests upgrades on a dummy instance before applying them to production.
- **Rolling Upgrades**: Performs rolling node upgrades to minimize the downtime and ensure high availability. Ensures the compatibility with Kubernetes API and resource definitions before upgrading.

## Prerequisites

- Kubernetes [1.23+](https://kubernetes.io/releases/)
- Cisco Network Services Orchestrator (NSO) Container Image [6.1+](https://www.cisco.com/c/en/us/products/collateral/cloud-systems-management/network-services-orchestrator/bulletin-c25-742437.html)

> [!warning]
>
> **Cisco Network Services Orchestrator (NSO) software is not distributed by this Helm chart.**
>
> Cisco Network Services Orchestrator (NSO) container image must be provided by the user of the chart,
> based or built on top of the official NSO Docker Image distributed by Cisco Systems, Inc.  
> The following values must be used to setup the image reference: `image.*`.

## Usage

This chart expects to be manage as a standard [Helm chart](https://helm.sh/docs/topics/charts/).
All the commands from the [Helm CLI](https://helm.sh/docs/helm/) apply.

```console
helm install cisco-nso oci://ghcr.io/leocolomb/charts/cisco-nso
```

## License

This project is licensed under [Apache License, Version 2.0](LICENSE).

Cisco Network Services Orchestrator (NSO) and Tail-f Network Control System (NCS) are Copyright (c) Cisco Systems, Inc.
