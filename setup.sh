#! /bin/bash

echo "**********************************************************"
echo "Script to setup the kubernetes cluster"
echo "Author: SAIKRISHNA"
echo "**********************************************************"
sleep 4

# running helm 
# assuming you already installed helm and have rbac-config.yaml
echo "executing rbac-config file"
sleep 3
kubectl create -f rbac-config.yaml
echo "=============================================================="
echo "wait for 15secs to up and running the container"
echo "=============================================================="
sleep 15

# create the service account
echo "installing tiller service account for helm"
sleep 3
helm init --service-account tiller
echo "=============================================================="
echo -e "Wait for 25sec to create and run the service account \n after that you can check helm verison"
sleep 25

# check the version it should output two values
echo "=============================================================="
echo "checking for successful helm install"
sleep 3
helm version
sleep 5

# to install kubernetes dashboard
echo "=============================================================="
echo "installing kubernetes dashboard"
sleep 3
helm install --namespace kube-system --name dashboard helm-charts/kubernetes-dashboard
sleep 20

# to install heapster chart
echo "=============================================================="
echo "installing heapster chart"
sleep 3
helm install --namespace kube-system --name heapster helm-charts/heapster
sleep 20

# To install metrics chart
echo "=============================================================="
echo "installing metrics chart"
sleep 3
helm install --namespace kube-system --name metrics helm-charts/kube-state-metrics
sleep 20

echo "=============================================================="
echo "collecting secret token for kubernetes dashboard"
echo -e "\n" >> secrets.txt
kubectl describe secrets -n kube-system $(kubectl get secrets -n kube-system | grep -oh "\w*dashboard-kubernetes-dashboard-token-\w*") >> secrets.txt
cat secrets.txt
echo "=================================================================="
echo "now copy the bottom token to sign into kuberenetes dashboard"
echo "=================================================================="

