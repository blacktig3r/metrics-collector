# Node Metrics Collector

## Overview

This project collects system-level metrics from Kubernetes nodes by leveraging Prometheus Node Exporter and storing the collected metrics in a persistent volume. The key components are:

1. **Node Exporter** running as a DaemonSet on Kubernetes nodes to expose system metrics.
2. **Metrics Collector** which runs as a Kubernetes CronJob to fetch metrics from Node Exporter and store them in persistent storage using a Persistent Volume Claim (PVC).
3. **Inspect Volume Pod** to check the metrics files stored in the volume.
   
The collected data is stored in a PVC to ensure persistence, even in case of pod restarts. The cron job runs periodically, pulling metrics and saving them in timestamped log files.

## Project Structure

```plaintext
./
├── Dockerfile
├── fetch_metrics.sh
├── helm-charts
│   ├── Chart.yaml
│   ├── templates
│   │   ├── cronjob.yaml
│   │   └── pvc.yaml
│   └── values.yaml
└── manifest
    ├── inspect-volume-pod.yaml
    └── node-exporter-daemonset.yaml

## Docker Container

The cron job is containerized using the provided Dockerfile. The image is built with the necessary Bash script (fetch_metrics.sh) and pushed to Google Container Registry (GCR) or any other container registry.

```plaintext

#Build the Docker image:

docker build -t gcr.io/<your-project-id>/metrics-collector:latest .

#Push the image to GCR:

docker push gcr.io/<your-project-id>/metrics-collector:latest
