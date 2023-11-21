# blue-green update test

# test scenario
# 1. create 2 deployment
# 2. create service resource
# 3. change svc selector

kubectl apply -f blue-deployment.yaml
kubectl get pods
kubectl get deploymnets.app
kubectl expose deployment blue --type=NodePort --port=80 --target-port=8080 --name=app-svc
kubectl get svc
kubectl apply -f green-deployment.yaml
kubectl get nodes -o wide
curl <node-ip>:<node-port>
>> 'This is Blue App'
kubectl edit svc app-svc
>> 'selctor.app:blue' >> 'selctor.app:green'
curl <node-ip>:<node-port>
>> 'This is Green App'
