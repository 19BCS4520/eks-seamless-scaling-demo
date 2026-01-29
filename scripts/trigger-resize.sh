#!/bin/bash
# Usage: ./trigger-resize.sh [POD_NAME] [NEW_LIMIT]
POD=$1
MEM=$2

if [ -z "$POD" ]; then
  echo "Usage: ./trigger-resize.sh <pod-name> <memory-limit>"
  exit 1
fi

echo "🚀 Patching Pod $POD to limit: $MEM..."
kubectl patch pod $POD --patch "{\"spec\":{\"containers\":[{\"name\":\"payment-app\",\"resources\":{\"limits\":{\"memory\":\"$MEM\"},\"requests\":{\"memory\":\"$MEM\"}}}]}}"

echo "✅ Patch sent. Verifying status..."
sleep 2
kubectl get pod $POD -o wide