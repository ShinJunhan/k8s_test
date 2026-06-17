# step08_nfs_pod_volume/memo.md

### nfs 볼륨 사용해보기

```bash

# 모든 노드에 nfs 클라이언트를 설치한다 (k8s 의 PV 가 사용할 예정) 
# 172.16.8.10(master), 172.16.8.11(node1), 172.16.8.12(node2)
sudo apt-get update && sudo apt-get install -y nfs-common

# pod,svc,pv,pvc 확인
watch -n 3 "kubectl get pod,svc,pv,pvc -o wide"


k apply -f pv.yaml
k apply -f pvc.yaml
k apply -f pod.yaml

# pod1 에 접속해서 hello.txt 파일을 만든다 
kubectl exec -it pod1 -- sh -c "echo 'Hello from pod1' > /mount01/hello.txt"
# 내용확인
kubectl exec -it pod1 -- cat /mount01/hello.txt

# nfs 서버에서도 확인
ssh user1@172.16.8.203 "ls -al /nfs/shared/pv-test-1"

# pod1 만 삭제 후에
k delete -f pod.yaml

# 다시 배포해서
k apply -f pod.yaml 

# 동일한 pv 를 사용하는지 확인
kubectl exec -it pod1 -- cat /mount01/hello.txt

# 이번에는 pod 와 pvc 삭제 해보자
k delete -f pod.yaml 
k delete -f pvc.yaml 

# pv 는 Released 된 상태로 남아 있는 것을 확인한다
k get pv

# 다시 pod 와 pvc 를 배포 해보자
k apply -f pod.yaml
k apply -f pvc.yaml

# pod 와 pvc 모두 pending 상태임을 알 수 있다
# pod 는 pvc 가 없어서 pending 상태
# pvc 는 pv 와 붙을 수 없어서 pending 상태
# 현재 남아 있는 pv 는 예전 pvc 지문을 가지고 있어서 지금 pvc 와 연결이 안된다 (재연결 하려면 기존 연결 고리를 끊고서 재연결 해야 한다)
# pv 를 에디터 모드로 열어서 예전의 pvc 와의 연결고리(설정정보, 지문)을 삭제 해주어야 한다
k edit pv pv01

# 테스트 후 삭제
k delete -f .
```