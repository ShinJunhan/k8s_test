# step08_nfs_deploy_volume/memo.md

### pod 를 여러개 띄울 때, 다같이 하나의 폴더 (nfs) 를 공유하면서 읽고 쓰게 만들고 싶다면 지금의 예제처럼 만들면 된다

```bash
# pod 의 이름을 검색해서
k get pod

# pod 의 이름이 "deploy이름-랜덤한 문자열" 임을 확인한다

# pod 의 이름을 복사해서 아래를 실행
k exec -it <pod 이름1> -- sh -c "echo 'hello from pod1' >> /mount01/message.txt"
k exec -it nginx-deploy-69bd85f9b-j276t -- sh -c "echo 'hello from pod1' >> /mount01/message.txt"

k exec -it <pod 이름1> -- cat /mount01/message.txt
k exec -it nginx-deploy-69bd85f9b-j276t -- cat /mount01/message.txt

k exec -it <pod 이름2> -- cat /mount01/message.txt
k exec -it nginx-deploy-69bd85f9b-jf5sq -- cat /mount01/message.txt

k exec -it <pod 이름3> -- cat /mount01/message.txt
k exec -it nginx-deploy-69bd85f9b-sdfp2  -- cat /mount01/message.txt

k exec -it <pod 이름2> -- sh -c "echo 'hello from pod2' >> /mount01/message.txt"
k exec -it nginx-deploy-69bd85f9b-jf5sq -- sh -c "echo 'hello from pod2' >> /mount01/message.txt"
```