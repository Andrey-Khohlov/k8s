- kubectl apply -f namespace.yaml
# secret_1.yaml - Секрет задан в yaml
- kubectl apply -f secret_1.yaml
- kubectl get secret -n secrets-investigation
- kubectl get secret -n secrets-investigation -o yaml
- echo 'cXdlcnR5' | base64 --decode
- echo -n 'admin' | base64

# secret_2.yaml - Секреты могут быть смонтированы как тома данных
меняет секреты в поде на лету после обновления манифеста секрета

в поде mypod буду примонтирована папка etc/foo с файлами password и username содержащими данные из секрета first-secret
- kubectl apply -f secret_2.yaml
- kubectl exec -it mypod -n secrets-investigation -- sh
- cd..
- cd etc/foo
- cat password
- kubectl delete secret mysecret

# secret_5.yaml - Секреты могут быть переданы в контейнер как переменные среды окружения
не меняет секреты в поде на лету
- kubectl apply -f secret_5.yaml
- kubectl -n secrets-investigation exec -it declarative-deployment-db559d85d-9w69m -- sh
- env

# kustomization.yaml - управления секретами и конфиг-мапами
- kubectl apply -k ./
- Здесь отредактированный секрет создается как новый Secret объект вместо обновления существующего Secret объекта. Возможно, вам потребуется обновить ссылки на секрет в ваших модулях.

# get Kubernetes deployment options
- kubectl run --image=ubuntu ubuntu --dry-run=client -o yaml
- add field 'command: ["sleep", "3600"]'
