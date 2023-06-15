docker build -f ./Dockerfile  -t registry.cn-shanghai.aliyuncs.com/fengzhihao/frp:master ../

docker stop frp
docker rm frp
docker run -it --rm \
     -p 7500:7500 \
     -p 7001:7000 \
     -p 8080:8080 \
     --name frp \
     -v /Users/fengzhihao/project/fzh/frp:/mnt/frp \
     registry.cn-shanghai.aliyuncs.com/fengzhihao/frp:master \
     /bin/bash