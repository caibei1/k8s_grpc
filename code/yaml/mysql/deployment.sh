#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "echo 切换root用户成功...\r"
#send "./mv.sh\r"
#send "cd /home/wsj/k8s/k8s_grpc/yaml\r"
send "kubectl apply -f mysql-volume.yaml \r"
send "echo 启动mysql-volume成功...\r"

send "kubectl create -f mysql-configmap.yaml \r"
send "echo 启动mysql-configmap成功...\r"

send "kubectl create -f mysql-secret.yaml \r"
send "echo 启动mysql-secret成功...\r"

send "kubectl apply -f mysql-deployment.yaml \r"
send "echo 启动mysql-deployment成功...\r"

send "kubectl apply -f mysql-service.yaml \r"
send "echo 启动mysql-service成功...\r"

expect eof
exit