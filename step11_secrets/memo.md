# step11_secrets/memo.md

```bash
# pod, secret, deploy 생성
k apply -f .

# pod, secret 조회
k get pod,secret

# 만들어진 pod 안으로 진입
k exec -it secret-test-deploy-5c7f6d956d-2xdrv -- sh

# 환경변수 조회 (결과: tiger)
echo $DB_PASSWORD
exit

# 전체 삭제
k delete -f .
```