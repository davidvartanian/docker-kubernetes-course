# Install Ingress Nginx on GKE

## Run in GKE console before helm-init
- kubectl create serviceaccount --namespace kube-system tiller
- kubectl create clusterrolebinding tiller-cluster-role --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

## Helm init and ingress install
- helm init --service-account tiller --upgrade
- helm install stable/nginx-ingress --name my-nginx --set rbac.create=true