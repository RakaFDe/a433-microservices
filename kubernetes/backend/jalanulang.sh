kubectl delete -f karsajobs-deployment.yml -n karsajob
sleep 10
kubectl delete -f karsajobs-service.yml -n karsajob
sleep 20
kubectl apply -f karsajobs-deployment.yml -n karsajob
sleep 10
kubectl apply -f karsajobs-service.yml -n karsajob
