FROM registry.cn-shanghai.aliyuncs.com/fengzhihao/ubuntu:20.04

ADD ../ /usr/local/project/src/frp

ENV GO111MODULE=on
# 七牛云
# ENV GOPROXY=https://goproxy.cn,direct 
# 百度
ENV GOPROXY=https://goproxy.baidu.com/
ENV GOPROXY=https://goproxy.io,direct

WORKDIR /usr/local/project/src/frp

RUN go mod download

CMD go run cmd/frps/*.go -c docker/frps.ini