# Configmap

1) Создаем configmap

Для этого выполним команду:

```bash
kubectl apply -f ~/slurm/practice/1.kube-basics-lecture/5.configmap/
```

2) Проверяем

Проверим, что configmap попал в контейнер, для этого пробросим порт из пода и выполним curl.
Для этого выполним команду, заменив имя pod на имя вашего pod(``можно воспользоваться автоподстановкой по TAB``).

```bash
kubectl port-forward my-deployment-5b47d48b58-l4t67 8080:80 &
curl 127.0.0.1:8080
```

В результате выполнения curl увидим имя пода, который обработал запрос. Результат должен быть примерно таким:

```bash
my-deployment-5b47d48b58-l4t67
```
