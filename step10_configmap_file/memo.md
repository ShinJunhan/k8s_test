# step10_configmap_file/memo.md


### configmap 내용을 file 처럼 활용하기
```bash
k apply -f .

k get cm

k describe cm hello-config

k apply -f .

# 실행 중인 컨테이너 아이디를 이용해서 컨테이너 안으로 진입
k exec -it nginx-custom-74877845c4-9mcmb -- /bin/bash

# configmap 환경변수 조회
cat /etc/nginx/nginx.conf

k delete -f .

```