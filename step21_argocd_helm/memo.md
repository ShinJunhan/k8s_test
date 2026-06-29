# step21_argocd_helm/memo.md

### 공식 helm chart 를 이용해서 argo cd 설치하기

```bash
# 1. ArgoCD 공식 레포지토리 등록
helm repo add argo https://argoproj.github.io/argo-helm

# 2. 등록된 저장소에 어떤 내용이 있는지 업데이트 하기
helm repo update

# 3. helm 저장소 목록 확인
helm repo ls

# 4. 설치할 namespace 만들기 (이미 만들어 놓았음)
kubectl create namespace argocd

# 5. helm 을 이용해서 설치하기
# helm install <배포 이름> <배포할 내용> -n <namespace> -f <옵션 정보를 가지고 있는 yaml>
helm install my-argocd argo/argo-cd -n argocd -f my-values.yaml

# 비밀번호 
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# 접속 주소 
kubectl get svc -n argocd

# helm 으로 배포된 app 목록 확인
helm ls
helm ls -n argocd

# values.yaml 또는 소스코드를 수정 후에 다시 적용하기
# values.yaml 을 수정하고 아래의 명령어를 다시 실행해 보자
# https 외에 http 로도 접속 가능하도록
#  extraArgs:
#   - --insecure
helm upgrade my-argocd argo/argo-cd -n argocd -f my-values.yaml

# http://172.16.8.31 로 접속해도 경고가 발생하지 않는다


# helm 으로 배포된 app 삭제
# helm uninstall <name> -n <namespace>
helm uninstall my-argocd -n argocd
```