#!/bin/bash
# Script untuk deploy MongoDB di namespace karsajob dengan jeda 10 detik

NAMESPACE="karsajob"

echo "🚀 Deploy ConfigMap..."
kubectl apply -f mongo-configmap.yml -n $NAMESPACE
sleep 10

echo "🚀 Deploy Secret..."
kubectl apply -f mongo-secret.yml -n $NAMESPACE
sleep 10

echo "🚀 Deploy PV & PVC..."
kubectl apply -f mongo-pv-pvc.yml -n $NAMESPACE
sleep 10

echo "🚀 Deploy StatefulSet..."
kubectl apply -f mongo-statefulset.yml -n $NAMESPACE
sleep 10

echo "🚀 Deploy Service..."
kubectl apply -f mongo-service.yml -n $NAMESPACE
sleep 10

echo "✅ Semua resource MongoDB sudah di-deploy!"
kubectl get all -n $NAMESPACE
