# step06_pod_volume/memo.md


### pod 안에 특정 container 로 접속해서 작업하기
```bash
# pod 정보 조회
k describe pod real-shared-pod

# pod 안에 container 가 여러 개인 경우에는 -c <container 이름> 옵션을 추가해서 접속한다
# web-container 로 접속
k exec -it real-shared-pod -c web-container -- /bin/bash

# web-container 안에서 실행하기
echo 'hello, world' > /web-data/hello.txt

# log-container 로 접속 (busybox는 /bin/bash 가 없어서 가벼운 sh 를 실행
# k exec -it real-shared-pod -c log-container -- /bin/bash
k exec -it real-shared-pod -c log-container -- sh

# log-container 안에서 실행
ls
cd log-data
# hello.txt 파일이 존재
ls
cat hello.txt

# web-container 에서 실행하기 (새로운 문장 추가)
echo 'bye~' >> /web-data/hello.txt

# log-container 에서 업데이트된 해당 파일 재확인
cat hello.txt

```