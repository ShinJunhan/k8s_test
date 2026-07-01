# step23_helm_chart_use/memo.md

### helm chart 저장소에 있는 chart 활용하기

```bash
# 저장소 등록
# helm repo add <저장소이름> <저장소위치>
helm repo add my-repo https://ShinJunhan.github.io/my-helm-chart/

helm update

helm search repo my-repo
[user1@master my-helm-chart]$ helm search repo my-repo
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                 
my-repo/market-app      0.1.0           1.0.0           Market Application Helm Chart for Kubernetes
my-repo/member-app      0.1.1           1.0.1           fastapi member application

# 바로 install 하지 않고 local 로 다운로드(tgz 파일) 해서 커스터마이징도 가능하다
helm pull my-repo/market-app
helm pull my-repo/member-app

# 압축풀기
# tar -zxvf <압축파일명>
tar -zxvf market-app-0.1.0.tgz
tar -zxvf member-app-0.1.1.tgz 

# tgz 파일을 생성하지 않고 바로 압축을 해제해서 원하는 경로에 넣을 수도 있다
helm pull my-repo/market-app --untar --untardir ./charts
helm pull my-repo/member-app --untar --untardir ./charts
```