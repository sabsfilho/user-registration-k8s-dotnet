#install kubectl
#https://kubernetes.io/docs/reference/kubectl/kubectl/
#https://github.com/devcontainers/features/tree/main/src/kubectl-helm-minikube
#put this in your devcontainer.json
#"ghcr.io/devcontainers/features/kubectl-helm-minikube:1": {}
#run minikubes
minikube start --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1
# Run a test container image that includes a webserver
kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
# View the Deployment
kubectl get deployments
# open a second terminal window to run the proxy
kubectl proxy
# check it on browser
# http://localhost:8001/version
# or terminal
curl http://localhost:8001/version
# view the pods
kubectl get pods
#http://localhost:8001/api/v1/namespaces/default/pods/hello-node-66d457cb86-jpjfv:8080/proxy/
curl http://localhost:8001/api/v1/namespaces/default/pods/hello-node-66d457cb86-jpjfv:8080/proxy/
# view the events
kubectl get events
# view kubectl configuration
kubectl config view
# view log
kubectl logs hello-node-66d457cb86-jpjfv
# expose pod to internet
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
# view services 
kubectl get services
# run service
minikube service hello-node
#clean up
kubectl delete service hello-node
kubectl delete deployment hello-node
# 
# user-registration-app
#run kubernetes
kubectl apply -f user-registration-app-deployment.yaml
kubectl get pods
kubectl proxy
#pod = user-registration-app-deployment-76fc757df7-47tn7
#targetPort = 5432
#run on another terminal
curl http://localhost:8001/api/v1/namespaces/default/pods/user-registration-app-deployment-76fc757df7-47tn7:5432/proxy/
# 
# clear kubernetes
kubectl delete service user-registration-app-service
kubectl delete deployment user-registration-app-deployment

#debug commands
kubectl get all
kubectl logs user-registration-app-deployment-76fc757df7-47tn7 --all-containers
kubectl describe pod user-registration-app-deployment-76fc757df7-47tn7
kubectl describe service user-registration-app-service

# run service
minikube service user-registration-app-service
##### DONT OPEN IN YOUR BROWSER BECAUSE VM DEVCONTAINER IP REDIRECTION
## JUST TYPE ON YOUR TERMINAL
curl -L http://192.168.49.2:30001 

#stop
minikube stop
#delete minikube VM
minikube delete
