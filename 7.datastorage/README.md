# Подключаем ceph в кластер kubernetes

* [1. rbd](rbd/README.md)
* [2. cephfs](cephfs/README.md)
* [3. fileshare](fileshare/README.md)

## !! Все работы проводим под рутом на master-1

```bash
ssh master-1.s<номер вашего логина>
sudo -s
```

### Ставим ceph с помощью ceph-ansible

1) Клонируем сценарий автоматизированной установки ceph в каталог /srv и переходим в каталог со сценарием

```bash
cd /srv
git clone git@gitlab.slurm.io:slurm/ceph-nautilus.git
cd ceph-nautilus
```

2) Запускаем сценарий скриптом, который автоматически поправит инвентарь

```bash
sh  _deploy_cluster.sh
```

Следим за выводом на экран. Ждем отчета об успешном завершении
Если все хорошо, последний таск сценария покажет в выводе:

`health: HEALTH_OK`

Если сообщение не HEALTH_OK - есть вероятность, что не все компоненты успели запуститься, проверим позже на node-1.

## !! Далее будем работать на двух серверах: node-1 и master-1 !!
## !! Все комадны `kubectl` выполняются на master-1 !!
## !! Команды `ceph` и `rbd` выполняются на node-1 !!

* [1. Устанавливаем CSI Driver для Ceph RBD](rbd/README.md)
* [2. Устанавливаем CSI Driver для Ceph FS](cephfs/README.md)
* [3. Запускаем приложение fileshare](fileshare/README.md)
