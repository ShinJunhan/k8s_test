
## dev 네임스페이스를 사용할수 있는 team1 계정 만들어보기

```bash

# config 파일을 생성할수 있는 자원을 만들기
k apply -f dev-team1.yaml

```

#### generate.sh 파일을 만든다

```bash

chmod +x ./generate.sh
# 실행하면 파일이 만들어진다.
./generate.sh

```

#### 만들어진 team1.config 파일을 kubectl 이 사용하게 하면 dev namespace 만 쓸수 있다.

#### context 관련 명령어

```bash

# 현재 사용가능한 context 목록 조회
k config get-contexts

# context 전환하기 
k config use-context <context명> 

```