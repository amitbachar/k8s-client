#!/bin/sh
echo "running entry.sh"
df -h
export http_proxy=http://genproxy:8080/
export https_proxy=http://genproxy:8080/
pip install -r requirements.txt
pip list

if [ -d /admin-volume/.kube ]
then
   echo "copying k8s .kube cluster configuration"
   mv /root/.kube /root/.kube_orig
   cp -r /admin-volume/.kube /root/
fi

#while true; do python ./app/get_pod_info_table_view.py ; sleep 10;done

exec $@
