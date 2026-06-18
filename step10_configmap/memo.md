# step10_configmap/memo.md


### configmap 활용하기
```bash
k apply -f .

k get cm

k describe cm hello-config

k apply -f .

# pod 안 컨테이너에 진입
k exec -it my-deploy-f6fc7fddd-jwbj4 -- /bin/bash

# configmap 환경변수 조회
echo $APP_MODE          # 결과 : development
echo $GREETING_MSG
exit

k delete -f .
```