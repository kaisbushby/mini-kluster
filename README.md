# Project Mini Kluster

## Node configuration of K3s Cluster

This is my own personal project to build a Kubernetes cluster at home, which is heavily based off [Riscanfre's pi-cluster project](https://github.com/ricsanfre/pi-cluster/tree/master) with a few minor variations in the technology stack and its configuration.
The philosophy of this project is to reduce reliance on 3rd party services and cloud resources, and locally host everything using open source software as much as possible.

The services in the cluster are manually managed by the Raspberry Pi via Helm and Kubectl. Although I have Ansible setup on the Raspberry Pi, I haven't gotten through learning and setting up the playbooks to automate the setup of the cluster, which I plan on doing in the future.

The cluster consists of 6 Dell Optiplex Micro for the Master/Worker nodes and a Raspberry Pi 5 as a Control node for running Ansible and Kubectl/Helm. The backup solution for the cluster is a Synology DS223 2-bay NAS running a 8TB x 2 disk RAID 0 configuration, which was gifted by my Dad.
The network switch used to connect to connect the cluster together is a Ubiquiti UniFi Switch Lite 16 port switch. Origianally the cluster was using an old TP-Link PoE 8 port network switch but I had a lot of PoE related issues with the Raspberry Pi. In the end I replaced the TP Link switch with a Ubiquiti UniFi Switch Lite 8 port, and then with the 16 port variant later on.

The cluster was originally physically located in a cardboard box in the corner of my room, but after finding the [GeekPi RackMate T2](https://deskpi.com/products/deskpi-rackmate-t2-rackmount-12u-server-cabinet-for-network-servers-audio-and-video-equipment) on sale during a Black Friday I replaced it with the cardboard box immidiately. To mount the Dell Optiplex Micros to the new server rack, I 3D printed some [Dell Optiplex Micro 10 inch rack mounts](https://www.printables.com/model/980541-dell-optiplex-7060-micropc-10-inch-rack-mount) and [Unifi 16 port PoE 10 inch rack mounts](https://www.printables.com/model/994138-ubiquiti-switch-lite-16-poe-10-inch-half-rack-moun) with my Ender3 v3 SE and Black PETG filament.

## Hosted Services
<!-- Icons from this website -->
<!-- https://dashboardicons.com -->
### On the K3s Cluster

|                                                        | Service                     |  Category              | Description |
| ---------                                              | -----------                 | -----------            | ----------- |
| <img width=35 src="Docs/Icons/K3s.svg">                | K3S                         | Kuberntes              | Lightweight version of K3s that uses etcd |
| <img width=35 src="Docs/Icons/Cilium.svg">             | Cilium                      | Networking             | Networking CNI to replace the default K3s CNI  |
| <img width=35 src="Docs/Icons/CoreDNS.svg">            | CoreDNS                     | Networking             | Internal Kubernetes DNS server  |
| <img width=35 src="Docs/Icons/ExternalDNS.png">        | ExternalDNS                 | Networking             | Updated A/AAAA records on an External DNS server |
| <img width=35 src="Docs/Icons/Istio.svg">              | Istio                       | Networking             | Service mesh for Kubernetes |
| <img width=35 src="Docs/Icons/NGINX.svg">              | NGINX                       | Networking             | Loadbalancer and Ingress |
| <img width=35 src="Docs/Icons/Rancher.svg">            | Rancher                     | Management             | Kubernetes Cluster Management tool |
| <img width=35 src="Docs/Icons/Rook.svg">               | Rook Ceph                   | Storage                | Storage Orchestrator for Kubernetes. Includes Block, NFS and Bucket storage |
| <img width=35 src="Docs/Icons/ESO.svg">                | External Secrets Operator   | Secrets/Certificates   | Syncs Kubernetes secrets with Hashicorp secrets  |
| <img width=35 src="Docs/Icons/CertManager.svg">        | CertManager                 | Secrets/Certificates   | Manages/Registers TLS Certificates |
| <img width=35 src="Docs/Icons/Prometheus.svg">         | Prometheus                  | Observibility          | Real time metrics monitoring |
| <img width=35 src="Docs/Icons/Grafana.svg">            | Grafana                     | Observibility          | UI for Metrics/Logs/Telemetry |
| <img width=35 src="Docs/Icons/Fluentbit.svg">          | Fluentbit                   | Observibility          | Log collector and aggregation |
| <img width=35 src="Docs/Icons/Loki.svg">               | Loki                        | Observibility          | Log aggregation for Grafana |
| <img width=35 src="Docs/Icons/Elastic Search.svg">     | Elastic Search              | Observibility          | Log storage/analytics |
| <img width=35 src="Docs/Icons/Kibana.svg">             | Kibana                      | Observibility          | UI for ElasticSearch |
| <img width=35 src="Docs/Icons/Tempo.svg">              | Tempo                       | Observibility          | Open-Telemetry monitoring |
| <img width=35 src="Docs/Icons/Keycloak.svg">           | Keycloak                    | Security               | Description |
| <img width=35 src="Docs/Icons/OAuth2-Proxy.svg">       | OAuth2-Proxy                | Security               | Description |
| <img width=35 src="Docs/Icons/Apache Kafka.svg">       | Kafka                       | Micro Service          | Real-time event/data streaming platform |
| <img width=35 src="Docs/Icons/CloudNativePG.svg">      | CloudNativePG               | Micro Service          | PostgreSql specialised for Kubernetes |
| <img width=35 src="Docs/Icons/MongoDB.svg">            | MongoDB                     | Micro Service          | NoSQL Database |
| <img width=35 src="Docs/Icons/RabbitMQ.svg">           | RabbitMQ                    | Micro Service          | Message Broker |
| <img width=35 src="Docs/Icons/Jenkins.svg">            | Jenkins                     | CICD                   | Code CICD |
| <img width=35 src="Docs/Icons/ntfy.svg">               | ntfy                        |                        | Sends push notification to ios/Android |

### Externally hosted

|                                                        | Service                     | Category               | Description |
| -----------------                                      | -----------                 | -----------            | ----------- |
| <img width=35 src="Docs/Icons/Technitium.svg">         | Technitium DNS              | Networking             | DNS Server for external home devices |
| <img width=35 src="Docs/Icons/Helm.svg">               | Helm                        | Management             | Kubernetes package manager|
| <img width=35 src="Docs/Icons/HashiCorp Vault.svg">    | Hashicorp Vault             | Secrets/Certificates   | Secret management for the cluster |
| <img width=35 src="Docs/Icons/RustFS.svg">             | RustFS                      | Storage                | Running on NAS for simplifying backups |

### Third-party

|                                                        | Service                     | Category               | Description |
| --------------------                                   | -----------                 | -----------            | ----------- |
| <img width=35 src="Docs/Icons/LetsEncrypt.svg">        | Lets Encrypt                | Secrets/Certificates   | Signs valid TLS certificates |
| <img width=35 src="Docs/Icons/Cloudflare.svg">         | Cloudflare                  | Networking             | Domain name registration and forwarding traffic via Cloudflared tunnels |
| <img width=35 src="Docs/Icons/GitHub.svg">             | GitHub                      | Code Repository        | Code Repository |


### Introducing the new AI node!
I've added an LLM inferencing node, which I made using spare PC parts and a RTX 4080 and 64GB RAM that I pulled out from my gaming system. The aim of this node is to run vLLM and llama.cpp for interencing LLM models to analyse unstructured linguistic data and run as a coding agent.

### TODO List

#### Software to setup on Cluster

- [x] Domain name
- [x] Cilium CNI
- [x] Helm on Raspberry Pi
- [x] Hashicorp vault and External Secrets Operator
- [x] Cloudflare Certbot for LetsEncrypt
- [x] CertManager
- [x] Rancher
- [x] Istio
- [x] External DNS + update credentials for DNS Server
- [x] Longhorn
- [x] SeaweedFS
- [ ] K3s Backup solution with NAS
- [ ] Node Backup solution with NAS
- [x] Replace Longhorn/SeaweedFS with Rook Ceph/RadosGW
- [x] Keycloak + Integrate OIDC with other services
- [x] Prometheus with Grafana
- [ ] Prometheus alerts + ntfy notifications
- [x] EKF Logging stack (ElasticSearch, Fluentbit, Kibana)
- [x] Fluentbit + Loki for Grafana
- [x] OpenTelemetry and Tempo
- [x] Apache Kafka on KRaft mode
- [ ] Create a single disk StorageClass with CRUSH mapping for Postgres
- [ ] Jenkins CICD
- [ ] Apache Nifi

#### Hardware setup on Cluster

- [x] 8 port switch
- [x] Geepki 12U Mini rack
- [x] 6th cluster node
- [x] HDDs for Kubernetes Storage
- [x] Replace 8 port switch with a 16 port switch
- [x] Build AI node using GPU from Gaming PC
  - [x] Install K3s
  - [x] Install CudaToolkit
  - [x] Setup vLLM + llama.cpp environment
  - [x] Create script to run Coding Agent LLM
    - [ ] Tune script for higher t/s
