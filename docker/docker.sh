docker build -f ./docker/Dockerfile  -t registry.cn-shanghai.aliyuncs.com/fengzhihao/frp:master .
docker build -f ./docker/Dockerfile.client  -t registry.cn-shanghai.aliyuncs.com/fengzhihao/frp:master-client .
docker build -f ./docker/Dockerfile.server  -t registry.cn-shanghai.aliyuncs.com/fengzhihao/frp:master-server .
docker stop frp
docker rm frp
docker run -it --rm \
     -p 10022:22 \
     -p 7500:7500 \
     -p 7001:7000 \
     -p 8080:8080 \
     -p 10080:10080 \
     -p 18080:18080 \
     -p 20080:20080 \
     --name frp \
     -v /Users/fzh/Desktop/project/fzh/fatedier/:/usr/local/project/src/ \
     registry.cn-shanghai.aliyuncs.com/fengzhihao/frp:master \
     /bin/bash


go run cmd/frps/*.go -c docker/frps.ini
go run cmd/frpc/*.go -c docker/frpc.ini