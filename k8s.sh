#!/bin/bash

version=v1.20.8

for i in {kube-apiserver,kube-controller-manager,kube-scheduler,kube-proxy}
do
    mkdir -p $i
    echo "FROM k8s.gcr.io/$i:$version" > ./$i/Dockerfile
done
