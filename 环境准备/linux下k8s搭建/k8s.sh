sealos clean

sealos init --passwd ww0819 \
	--master 192.168.1.102  \
	--pkg-url /home/wsj/k8s/download/kube1.17.0.tar.gz \
	--version v1.17.0 \
    --interface  wlp3s0


kubectl taint nodes --all node-role.kubernetes.io/master-