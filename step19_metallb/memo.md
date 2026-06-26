# step19_metallb/memo.md

## metallb 설치해서 사용하기

```bash

# 방법1. 바로 설치
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.10/config/manifests/metallb-native.yaml

# 방법2. download 후 설치
wget https://raw.githubusercontent.com/metallb/metallb/v0.13.10/config/manifests/metallb-native.yaml

# type: LoadBalancer 인 서비스는 metallb 가 없으면 EXTERNAL-IP 가 pending 상태이다 


k apply -f 01-metallb-native.yaml
# 위를 apply 한후에 잠시 1분 기다린다. -> 기다린 후에 실행
k apply -f 02-ip-pool.yaml
k apply -f 03-advertise.yaml
k apply -f deploy-svc-nginx.yaml

# 아래를 실행해서 nginx-lb-svc 에 EXTERNAL-IP 에 IP 주소가 부여된것을 확인한다
k get all svc -o wide | grep nginx-lb-svc
NAME                     TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE   SELECTOR
nginx-lb-svc             LoadBalancer   10.103.233.198   172.16.8.30   80:32125/TCP     92s   app=nginx-test
```