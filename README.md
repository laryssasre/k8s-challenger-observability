# K8s Challenger: Observability Stack (Grafana)

This repository contains a minimal observability stack using **Grafana** deployed on a local Kubernetes cluster powered by **K3D**.

 ## 🎯 Goal

- Set up a local Kubernetes cluster using K3D
- Create isolated environments (namespaces)
- Enforce resource usage limits with ResourceQuotas
- Deploy a containerized application (Grafana)
- Expose the application using a Service and Ingress
- Follow Kubernetes best practices using: `Deployment`, `Service`, `PersistentVolumeClaim`, `Ingress`, `Namespace`, and `ResourceQuota`
- Manage Ingress with `nginx-ingress` via Helm
- Persist Grafana dashboards and configurations across restarts using a PVC

## 🚀 How to Run

### 1. Prerequisites

- [Docker](https://www.docker.com/)
- [k3d](https://k3d.io/#installation)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)

### 2. Create the cluster and deploy everything

```bash
cd scripts/
chmod +x create.sh
./create.sh
```
### 3. Access Grafana on localhost
Access Grafana at: http://localhost:3000/
(Default user/pass: admin / admin)

On first login, you will be prompted to change the password.

### 4. Delete the cluster
```bash
cd scripts/
chmod +x delete.sh
./delete.sh
```
### 4. Data persistence
To test data persistence, change the admin user password, create dashboards and alert rules. Then, delete and recreate the cluster, your dashboards and settings will still be there.

