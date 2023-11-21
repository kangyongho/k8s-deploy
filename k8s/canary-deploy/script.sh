# canary-deploy test

# test scenario
# 1. create first deployment
# 2. create service
# 3. create canary deployment
# 4. scale replicas to deployments
# common label: name=app

# canary delploy test
kubectl apply -f blue-deployment.yaml
kubectl expose deployment blue --type=NodePort --port=80 --target-port=8080 --name=canary-svc --dry-run=client -o yaml > app-svc.yaml
# edit svc selector. left only common label
# selector.name.app
kubectl apply -f app-svc.yaml
kubectl apply -f canary-deployment.yaml
# check nodeport
kubectl get svc
curl <node-ip>:<node-port>
# scale replicas
kubectl scale deployment blue --replicas=7
kubectl scale deployment canary --replicas=3
curl <node-ip>:<node-port>

