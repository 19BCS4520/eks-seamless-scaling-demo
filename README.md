# 🚀 EKS 1.33: Zero-Downtime Scaling & Native Sidecars Demo

![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.33+-blue.svg)
![Status](https://img.shields.io/badge/Status-Beta-orange.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)



## 📖 Overview
This repository demonstrates two revolutionary features in **Kubernetes 1.33** that eliminate the "Restart Tax" for critical workloads:

1.  **In-Place Pod Resizing:** Dynamically scale CPU/Memory without restarting the container.
2.  **Native Sidecars:** Guarantee sidecar readiness (e.g., Service Mesh, Loggers) before the application starts.


## 🏗️ Architecture
The shift from destructive updates to seamless, in-place kernel patching.

![Legacy vs Modern Architecture](./images/legacy-vs-modern.png.png)

*Figure 1: Comparison of the Legacy "Restart" model vs. the EKS 1.33 "In-Place" model.*

## 🛠️ Prerequisites
* Kubernetes Cluster v1.33+ (or Minikube with `InPlacePodVerticalScaling=true`).
* `kubectl` installed and configured.
* Vertical Pod Autoscaler (VPA) installed.

## 🚀 Quick Start

### 1. Deploy the "Super Pod"
This pod uses a Native Sidecar for secure startup and In-Place Resizing for scaling.
```bash
kubectl apply -f manifests/03-super-pod.yaml
