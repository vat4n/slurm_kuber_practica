# Деплоим приложение fileshare

### Меняем в каталоге fileshare манифесты:

1) в ingress.yaml host: номер своего студента

```bash
cd ~/slurm/practice/7.ceph/fileshare
vi ingress.yaml

  - host: fileshare.s<номер своего логина>.edu.slurm.io
```

2) Запускаем приложение

```bash
kubectl apply -f .
```

3) Смотрим, что все поднялось

```bash
kubectl get pod
```

4) Если какие то проблемы - то смотрим describe пода

```bash
kubectl describe pod названиепода
```

5) Пробуем загрузить файл

```
curl -i fileshare.s<номер своего логина>.edu.slurm.io/files/ -T configmap.yaml
```

6) Проверяем появление файла на cephfs

Идем на node-1 и в каталоге /mnt/cephfs/volumes/csi/csi-vol-.... убеждаемся, что там появился файл configmap.yaml

### Пробуем проверить работу квоты

7) Вносим правильный url в команду вызова curl в скрипте test_quota.sh

8) Запускаем файл test_quota.sh и смотрим сколько файлов размеро 1Мб сможет загрузиться на диск, размером 10Мб
