# step04_service_nodeport/memo.md

```bash
k apply -f deploy.yaml 
k apply -f service.yaml

watch -n 3 "kubectl get pod,svc -o wide"
```

### 외부(window) 에서 web browser 를 열어서 http://172.16.8.10:30001/ 로 요청해보기
#### http://172.16.8.10:30001 , http://172.16.8.11:30001, http://172.16.8.12:30001 모두 다 가능

```bash
# 실습 후 마무리
k delete -f . 
```