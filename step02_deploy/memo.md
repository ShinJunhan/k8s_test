# step02_deploy/memo.md

```bash
# pod 생성
k apply -f deploy.yaml 

# pod 확인
k get pod

# deploy 확인
k get deploy

# 새로운 보조 터미널 열어서 3초마다 pod 를 감지하는 프로세스 시작
watch -n 3 "kubectl get pod -o wide"

# deploy. yaml 파일로 적용한 것을 삭제
k delete -f deploy.yaml

# httpd:alpine 이라는 이미지를 이용해서 deploy2.yaml 문서를 만들어서 pod를 2개 띄우기
# httpd 는 apache 웹서버 이미지

k apply -f deploy2.yaml 

# deploy2.yaml 파일로 적용한 것을 삭제
k delete -f . deploy2.yaml

# 현재 경로에 있는 모든 yaml 파일을 읽어서 적용
k apply -f .

# 현재 경로에 있는 모든 yaml 파일로 적용한 것을 삭제
k delete -f .
```