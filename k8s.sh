#!/bin/bash

version=v1.20.8
arch=amd64

for i in {kube-apiserver,kube-controller-manager,kube-scheduler,kube-proxy}
do
    mkdir -p $i
    echo "FROM k8s.gcr.io/${i}-${arch}:${version}" > ./$i/Dockerfile
done
