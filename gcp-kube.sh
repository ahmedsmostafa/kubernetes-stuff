#!/bin/sh

export my_zone=us-central1-a
export my_cluster=standard-cluster-1

source <(kubectl completion bash)

gcloud container clusters create $my_cluster \
   --num-nodes 3 --enable-ip-alias --zone $my_zone
   
gcloud container clusters get-credentials $my_cluster --zone $my_zone

git clone https://github.com/GoogleCloudPlatformTraining/training-data-analyst

cd ~/training-data-analyst/courses/ak8s/15_RBAC/

kubectl create -f ./my-namespace.yaml

kubectl apply -f ./my-pod.yaml --namespace=production

