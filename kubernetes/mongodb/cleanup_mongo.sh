#!/bin/bash
# Script untuk membersihkan resource MongoDB di namespace karsajob

NAMESPACE="karsajob"

echo "🔄 Menghapus StatefulSet..."
kubectl delete statefulset mongo -n $NAMESPACE --ignore-not-found
sleep 10
echo "🔄 Menghapus Service..."
kubectl delete svc mongo -n $NAMESPACE --ignore-not-found
sleep 10
echo "🔄 Menghapus PVC..."
kubectl delete pvc -n $NAMESPACE --selector=app=mongo --ignore-not-found
kubectl delete pvc mongo-pvc -n $NAMESPACE
sleep 10
echo "🔄 Menghapus PV..."
kubectl delete pv mongo-pv --ignore-not-found
sleep 10
echo "🔄 Menghapus Secret..."
kubectl delete secret mongo-secret -n $NAMESPACE --ignore-not-found
sleep 10
echo "🔄 Menghapus ConfigMap..."
kubectl delete configmap mongo-config -n $NAMESPACE --ignore-not-found

echo "✅ Cleanup selesai. Cek dengan: kubectl get all -n $NAMESPACE"
