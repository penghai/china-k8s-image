#!/bin/bash

version=v1.20.8

for i in {kube-apiserver,kube-controller-manager,kube-scheduler,kube-proxy}
do
    mkdir -p $i
    echo "FROM asia.gcr.io/google-containers/$i:$version" > ./$i/Dockerfile
done
