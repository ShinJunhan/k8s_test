# step01_hello/memo.md


```bash
# pod1.yaml 문서를 클러스터에 적용하기
kubectl apply -f <파일명>
kubectl apply -f pod1.yaml

# pod 목록 확인
kubectl get pod

# pod 목록 상세 정보 확인
kubectl get pod -o wide

# pod 의 ip 주소를 확인해서 curl 로 요청해보기
curl 192.168.166.129

# host 의 8888 port 를 pod 의 80 port 로 연결해주는 NodePort 서비스 만들기
# 노출되는 node 의 port 는 30000~32767 사이에서 랜덤하게 배정
kubectl expose pod nginx-pod --type=NodePort --name=nginx-pod-svc --port=8888 --target-port=80 \
--labels="color=blue"

# 실행 중인 서비스 목록 검색
kubectl get svc

# 실행중은 서비스 목록 상세 검색
kubectl get svc -o wide


user1@master:~/k8s_test/step01_hello$ kubectl get svc
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
kubernetes      ClusterIP   10.96.0.1       <none>        443/TCP          80m
nginx-pod-svc   NodePort    10.96.212.154   <none>        8888:31618/TCP   104s

# 모든 node 에 대해서 실행해 본다.
http://172.16.8.10:31618/
http://172.16.8.11:31618/
http://172.16.8.12:31618/

# pod 삭제하기
kubectl delete pod <pod명>

# pod 삭제하기 방법2
kubectl delete -f <yaml 파일명>

# svc (서비스) 삭제하기
kubectl delete svc nginx-pod-svc
kubectl delete -f <yaml 파일명>

# 실습 후 vmware 를 끌 때 
master node 를 먼저 끄고 -> node1, node2 를 끈다

# 다시 vmware 를 켤 때
node1, node2 먼저 켜고 -> master node 를 켠다
```
