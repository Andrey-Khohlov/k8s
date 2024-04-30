This is a Kubernetes educational project

# docker
- docker build . -t py_app:v0.1
- docker images
- docker run py_app:v0.1
- docker run -p 8080:8080 go:v0.2  
* -p 8080:8080 - диапазон портов для которых открывают работать приложение на хосте по тегу, что создавали ранее

- docker tag go:v0.2 andreykhokhlov/l1:v0.2
- docker push andreykhokhlov/l1:v0.2

# minikube 
- minikube start
- minikube start --force --driver=docker
- minikube pause
- minikube unpause
- minikube stop
### delete clusters
- minikube delete
- minikube delete --all
# kubectl
## pods/deployment
### create
- kubectl create deployment first-deployment  --image=andreykhokhlov/l1:v0.2
### create pod
- kubectl run hello  --image=andreykhokhlov/l1:v0.2 --port=80
### apply
- kubectl apply -f deployment.yaml
### get
- kubectl get deployments 
- kubectl get deploy
### delete deployment
- kubectl delete deployment -n default first-deployment
### delete pods
- kubectl delete pods hello
### access to the cluster
- kubectl get po -A
### dashboard
- minikube dashboard
### describe pod
- kubectl describe po first-deployment-6568445876-4v79r 
- kubectl describe pods hello2
### run pod
- kubectl exec hello2 -- date
- kubectl exec -it hello2 -- sh
### log
- kubectl logs hello
### port-forward my-comp-port:pod_port
- kubectl port-forward hello 7788:80
- kubectl port-forward  -n lesson14 static-web 8080:8080 
- ключ -n означает неймспейс
## namespace
- kubectl apply -f namespace.yaml
- kubectl create ns lesson14
- kubectl delete -f namespace.yaml
- kubectl get pods -n lesson14
## service
- kubectl apply -f service.yaml
- kubectl get svc -n lesson14
## LoadBalancer
Позволяет открыть внешний доступ и жестко привязать внешний IP адрес к Поду.
## NodePort
Открывает на всех Нодах кластера порт, запросы попадающие на этот порт будут перенаправлены в Ваш Под.
Но, порты доступны в интервале 30000–32767.
## edit manifest
- export KUBE_EDITOR=nano
- kubectl edit pods -n lesson14 static-web
- kubectl get pods -n lesson14 static-web -o yaml
## rollout
- kubectl rollout history deployment.app/goapp-deployment -n lesson15
- kubectl rollout restart deployment.app/goapp-deployment -n lesson15
- kubectl rollout undo deployment.app/goapp-deployment -n lesson15



