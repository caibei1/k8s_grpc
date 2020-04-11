#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "echo 切换root用户成功...\r"
send "cp -r /home/wsj/go/src/github.com/caibei1/k8s_grpc/code/yaml/* /home/wsj/k8s/k8s_grpc/yaml \r"
send "echo yaml配置文件拷贝成功...\r"
send "cd /home/wsj/k8s/k8s_grpc/yaml\r"
send "echo 进入目标目录...\r"

#
# ----------nginx----------
#
send "kubectl create -f nginx/nginx-deployment.yaml\r"
send "echo 启动nginx-deployment成功...\r"

send "kubectl create -f nginx/nginx-service.yaml\r"
send "echo 启动nginx-service成功...\r"

#
# ----------mysql----------
#
send "kubectl apply -f mysql/mysql-volume.yaml \r"
send "echo 启动mysql-volume成功...\r"

send "kubectl create -f mysql/mysql-configmap.yaml \r"
send "echo 启动mysql-configmap成功...\r"

send "kubectl create -f mysql/mysql-secret.yaml \r"
send "echo 启动mysql-secret成功...\r"

send "kubectl apply -f mysql/mysql-deployment.yaml \r"
send "echo 启动mysql-deployment成功...\r"

send "kubectl apply -f mysql/mysql-service.yaml \r"
send "echo 启动mysql-service成功...\r"
#send "kubectl apply -f mysql/mysql-volume.yaml \r"

expect eof
exit