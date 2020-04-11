#源镜像
FROM golang:latest
#作者
MAINTAINER wushaojie
#设置工作目录
WORKDIR $GOPATH/src/test
#将服务器的go工程代码加入到docker容器中
ADD main.go $GOPATH/src/test
#go构建可执行文件
RUN go build -v  -o build/main main.go
#暴露端口
EXPOSE 8000
#最终运行docker的命令
ENTRYPOINT  ["/go/src/test/build/main"]

# sudo docker build -t wsjtest .  构建镜像
