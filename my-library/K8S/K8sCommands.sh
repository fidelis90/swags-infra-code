# create minikube cluster
minikube start --driver=virtualbox 

# delete cluster and restart in debug mode
minikube delete 

minikube start --driver=virtualbox --v=7 --alsologtostderr

# kubectl commands 

kubectl get nodes 

kubectl get pod 
kubectl get po -o wide 

kubectl get services 

kubectl create deployment nginx-depl --image=nginx

kubectl get deployment 

kubectl get replicaset 

kubectl edit deployment nginx-depl 

# debugging 

kubectl logs <podname>

kubectl exec -it <podname> -- bin/bash 

# create mongo deployment 

kubectl create deployment mongo-depl --image=mongo 

kubectl logs mongo-depl 

kubectl describe pod mongo-depl 

# delete deployment 

kubectl delete deployment mongo-depl 

kubectl delete deployment nginx-depl 

# create or edit config file 

vim nginx-depl.yml 

kubectl apply -f nginx-depl.yml 
kubectl get pod 
kubectl get deployment 

# delete with config 

kubectl delete -f nginx-depl.yml 

# Metrics 

kubectl top # returns cpu and memory usage for a cluster's pods or nodes 













































