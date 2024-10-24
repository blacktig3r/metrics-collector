#!/bin/bash

# Get the current timestamp
timestamp=$(date +'%Y%m%d_%H%M%S')

NODE_EXPORTER_URL="http://node-exporter.monitoring.svc.cluster.local:9100/metrics"
OUTPUT_DIR="/metrics"

# Fetch the metrics
curl -s $NODE_EXPORTER_URL > "${OUTPUT_DIR}/node_metrics_${timestamp}.log"

echo "Metrics fetched and saved to ${OUTPUT_DIR}/node_metrics_${timestamp}.log"

