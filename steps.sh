#! /bin/bash

# install helm
$ k create -f rbac-config.yaml

	serviceaccount "tiller" created
	clusterrolebinding "tiller" created

# create the servie account
$ helm init --service-account tiller

# check the version it should output two values
$ helm version

# to install kubernetes dashboard
$ helm install --namespace kube-system --name dashboard helm-charts/kubernetes-dashboard

# when the dashboard asks for token
$ kubectl get secrets -n kube-system

$ k describe secrets -n kube-system <name>

$ helm install --namespace kube-system --name heapster helm-charts/heapster

$ helm install --namespace kube-system --name metrics helm-charts/kube-state-metrics

