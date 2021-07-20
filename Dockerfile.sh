#!/bin/bash

version=v1.20.8

for i in {kube-apiserver,kube-controller-manager,kube-scheduler,kube-proxy}
do
    echo "FROM k8s.gcr.io/$i:v1.20.9" > ./$i/Dockerfile
done
