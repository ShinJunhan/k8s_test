#!/bin/bash
# step14_dev-namespace/generate.sh 
# 변수 셋팅
CLUSTER_NAME=$(kubectl config view --minify -o jsonpath='{.clusters[0].name}')
CLUSTER_URL=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')
CLUSTER_CA=$(kubectl config view --minify --raw -o jsonpath='{.clusters[0].cluster.certificate-authority-data}')


USER_TOKEN=$(kubectl create token team1 -n dev --duration=1000h)
# config 파일 생성 시작!
cat <<EOF > team1.config
apiVersion: v1
kind: Config
preferences: {}
clusters:
- cluster:
    certificate-authority-data: ${CLUSTER_CA}
    server: ${CLUSTER_URL}
  name: ${CLUSTER_NAME}
contexts:
- context:
    cluster: ${CLUSTER_NAME}
    namespace: dev
    user: team1
  name: dev-context
current-context: dev-context
users:
- name: team1
  user:
    token: ${USER_TOKEN}
EOF


echo "현재 폴더에 team1.config 파일이 생성되었습니다!"
