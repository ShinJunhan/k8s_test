# step09_statefulSet2/memo.md

```bash

k apply -f .

# 0번 파드 금고에 글씨 쓰기
kubectl exec nginx-deploy-0 -- sh -c "echo '<h1>여기는 0번방 (Master DB 대기실)</h1>' > /usr/share/nginx/html/index.html"

# 1번 파드 금고에 글씨 쓰기
kubectl exec nginx-deploy-1 -- sh -c "echo '<h1>여기는 1번방 (Slave-A)</h1>' > /usr/share/nginx/html/index.html"

# 2번 파드 금고에 글씨 쓰기
kubectl exec nginx-deploy-2 -- sh -c "echo '<h1>여기는 2번방 (Slave-B)</h1>' > /usr/share/nginx/html/index.html"

# netshoot 을 실행해서
kubectl run netshoot-pod -it --rm --image=nicolaka/netshoot --restart=Never -- sh

# netshoot pod 안에서 아래와 같은 형식으로 각각의 pod 를 개별적으로 찾아갈 수 있다
curl nginx-deploy-0.headless-svc
curl nginx-deploy-1.headless-svc
curl nginx-deploy-2.headless-svc

# pod 하나 강제로 없애보자
k delete pod nginx-deploy-0
# 테스트 pod 안에서 되살아난 pod 에 다시 요청해도 동일한 결과가 나온다
curl nginx-deploy-0.headless-svc

# namespace 조회
k get namespace

# test-ns 라는 새로운 namespace 생성
k create namespace test-ns

# namespace 조회 (namespace = ns)
k get ns

# 테스트 pod 를 test-ns 라는 namespace 에서 실행해서 아래의 curl 을 테스트 한다
kubectl run netshoot-pod -it --rm --image=nicolaka/netshoot --restart=Never -n test-ns -- sh

# 다른 namespace(test-ns) 에서 실행 중인 pod 안에서 실행하면 접근이 안된다 (동일 namespace 에서만 가능)
curl nginx-deploy-0.headless-svc

# 만일 접근하고자 하는 서비스가 다른 namespace 에 있으면 full domain name 을 다 적어야 한다
curl nginx-deploy-0.headless-svc.default.svc.cluster.local
curl nginx-deploy-1.headless-svc.default.svc.cluster.local
curl nginx-deploy-2.headless-svc.default.svc.cluster.local

# 테스트 네임스페이스 삭제
k delete ns test-ns

# 전체 배포 삭제 시도 
k delete -f .
# > pod 는 삭제 되었지만, pvc가 살아 있어서 pv 가 삭제를 못하고 있음
# > StatefulSet 에 template 으로 연결된 pvc 는 특별 취급을 받아서 함부로 지워지지 않는다

# 다시 배포하면 이전 상태와 동일하게 살아난다
k apply -f .
# 데이터가 다시 붙는지 확인
kubectl exec nginx-deploy-0 -- sh -c "echo '<h1>여기는 0번방 (Master DB 대기실)</h1>' > /usr/share/nginx/html/index.html"

kubectl run netshoot-pod -it --rm --image=nicolaka/netshoot --restart=Never -- sh

curl nginx-deploy-0.headless-svc

# 모두 파괴하고 싶으면 아래를 입력하고, 도중에 ctrl+c 누르고 빠져나와
k delete -f .

# 각 pv editor 진입 후
k edit pv pv-sf-1
k edit pv pv-sf-2
k edit pv pv-sf-3

# 아래의 코드 블럭을 제거시킨다 (해당 줄에 가서 dd 를 누르면 한 줄씩 지워짐 / 되돌리기는 u)
# 다 지우면 :wq 입력 후 빠져 나온다
 claimRef:
    apiVersion: v1
    kind: PersistentVolumeClaim
    name: web-storage-nginx-deploy-1
    namespace: default
    resourceVersion: "137979"
    uid: d476e531-5290-437c-9f06-a6b46b594854

# pvc 모두 지우기
k delete pvc --all
```