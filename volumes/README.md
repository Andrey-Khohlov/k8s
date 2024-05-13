https://serveradmin.ru/hranilishha-dannyh-persistent-volumes-v-kubernetes/

Работа с дисковыми томами в Kubernetes проходит по следующей схеме:

1. Вы описываете типы файловых хранилищ с помощью Storage Classes и Persistent Volumes. Они могут быть совершенно разными от локальных дисков до внешних кластерных систем и дисковых полок.
2. Для подключения диска к поду вы создаете Persistent Volume Claim, в котором описываете потребности пода в доступе к хранилищу - объем, тип и т.д. На основе этого запроса используются либо готовые PV, либо создаются под конкретный запрос автоматически с помощью PV Provisioners.
3. В описании пода добавляете информацию о Persistent Volume Claim, который он будет использовать в своей работе.
# Настройка общей файловой системы для всех контейнеров и доступ к ней
https://habr.com/ru/companies/otus/articles/717486/

Порядок применения абстракций:
1. SC
2. PV
3. PVC
4. POD
## Persistent Volumes (PV)
- oбъявим StorageClass в файле sc.yaml: 
  - kubectl apply -f cs.yaml
- создадим Persistent Volume которое будет использовать ресурсы нашего локального хранилища: 
  - kubectl apply -f pvlocal.yaml
  - kubectl get pv
## PersistentVolumeClaim
- kubectl apply -f pvc.yaml
- kubectl get pvc
- kubectl apply -f pod_pvc.yaml
- kubectl exec -it pod_pvc -- sh
- echo "test file created" >> /mnt/local.txt
- kubectl apply -f pod_pvc.yaml
- kubectl get pod
- kubectl exec -it pod-pvc-2 -- sh
- cat /mnt/local.txt
