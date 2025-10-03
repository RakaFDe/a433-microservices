kubectl delete statefulset mongo -n karsajob --cascade=orphan
sleep 5
kubectl delete pod mongo-0 -n karsajob --grace-period=0 --force
echo "delete stateful dan pod"
sleep 5
echo "proses patch dan dlete pv pvc"
kubectl patch pvc mongo-pvc -n karsajob -p '{"metadata":{"finalizers":null}}' --type=merge
kubectl delete pvc mongo-pvc -n karsajob --grace-period=0 --force
sleep 3
kubectl patch pv mongo-pv -p '{"metadata":{"finalizers":null}}' --type=merge
kubectl delete pv mongo-pv --grace-period=0 --force
