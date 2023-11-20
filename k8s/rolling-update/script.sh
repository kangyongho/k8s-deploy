# create deployment
kubectl create deployment rolling-update --image=mirlang2/k8s-hello:1.0 --port=8080 --dry-run=client -o yaml

# test pod
kubectl get pods -o wide

# into the node
curl <pod-ip>:<container-port>

# response check env
POD-NAME, POD-IP, NAMESPACE, HOST-NAME, HOST-IP