#!/bin/bash

version=v1.20.9
arch=amd64

for i in {kube-apiserver,kube-controller-manager,kube-scheduler,kube-proxy}
do
    mkdir -p $i
    echo "FROM k8s.gcr.io/${i}-${arch}:${version}" > ./$i/Dockerfile
done

#k8s.gcr.io/pause:3.2
#k8s.gcr.io/etcd:3.4.13-0
#k8s.gcr.io/coredns:1.7.0

for i in {pause:3.2,etcd:3.4.13-0,coredns:1.7.0}
do
    image_name=$(echo $i|awk -F : '{print $1}')
    mkdir -p $image_name
    version=$(echo $i|awk -F : '{print $2}')
    echo "FROM k8s.gcr.io/${image_name}:${version}" > ./$image_name/Dockerfile
done
