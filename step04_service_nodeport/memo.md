# step04_service_nodeport/memo.md

```bash
k apply -f deploy.yaml 
k apply -f service.yaml

watch -n 3 "kubectl get pod,svc -o wide"
```

### 외부(window) 에서 web browser 를 열어서 http://172.16.8.10:30001/ 로 요청해보기
#### http://172.16.8.10:30001 , http://172.16.8.11:30001, http://172.16.8.12:30001 모두 다 가능

```bash
# debug 용 pod 를 하나 띄워서 해당 pod 안에서 서비스 접근해보기
# nicolaka/netshoot 는 network 에 관련된 여러가지 테스트를 할 수 있는 이미지
kubectl run net-pod -it --rm --image=nicolaka/netshoot --restart=Never -- /bin/bash
```


```bash
# 실습 후 마무리
k delete -f . 
```