# Install Ingress Nginx on GKE

## Run in GKE console before helm-init
- kubectl create serviceaccount --namespace kube-system tiller
- kubectl create clusterrolebinding tiller-cluster-role --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

## Helm init and ingress install
- helm init --service-account tiller --upgrade
- helm install stable/nginx-ingress --name my-nginx --set rbac.create=true

## What to expect when making changes to the code
- checkout branch
- make changes
- commit changes
- push to github branch
- create PR
- wait for tests to show up "green"
- merge PR
- see changes appear on prod

## Install SSL Certificate
- https://github.com/jetstack/cert-manager
- follow instructions to install cert-manager with Helm
- create issuer.yaml file
- create certificate.yaml file
- push changes
- kubectl get certificates
- kubectl describe certificates
- kubectl get secrets (there should be a new secret containing the certificate)