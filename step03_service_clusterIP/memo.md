# step03_service_clusterIP/memo.md

```bash
# ClusterIP 서비스를 시작시킨다
k apply -f service.yaml

# 새로운 보조 터미널 열어서 3초마다 pod 와 svc 를 감지하는 프로세스 시작 (ip 주소 확인)
watch -n 3 "kubectl get pod,svc -o wide"

# 서비스의 ip 주소를 확인해서 요청을 보내본다
curl 10.104.72.141

# pod 의 갯수를 변경시켜 본다
k scale deployment nginx-deploy --replicas=1

# 서비스의 ip 주소를 확인해서 요청을 보내본다
curl 10.104.72.141

# pod 의 갯수를 변경시켜 본다
k scale deployment nginx-deploy --replicas=5

# 서비스의 ip 주소를 확인해서 요청을 보내본다
curl 10.104.72.141
```