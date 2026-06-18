# step09_statefulSet/memo.md

```bash

k apply -f .

# netshoot 을 실행해서
kubectl run netshoot-pod -it --rm --image=nicolaka/netshoot --restart=Never -- sh

# netshoot pod 안에서 아래와 같은 형식으로 각각의 pod 를 개별적으로 찾아갈 수 있다
curl nginx-deploy-0.headless-svc
curl nginx-deploy-1.headless-svc
curl nginx-deploy-2.headless-svc
```