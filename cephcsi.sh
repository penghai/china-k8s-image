#!/bin/bash

cephcsi=k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.2.0,quay.io/cephcsi/cephcsi:v3.4.0,k8s.gcr.io/sig-storage/csi-resizer:v1.2.0,k8s.gcr.io/sig-storage/csi-provisioner:v2.2.2,k8s.gcr.io/sig-storage/csi-attacher:v3.2.1,k8s.gcr.io/sig-storage/csi-snapshotter:v4.1.1

IFS=","
for i in $cephcsi
do
    image_name=$(echo $i|awk -F : '{print $1}'|awk -F / '{print $NF}')
    mkdir -p $image_name
    echo "FROM $i" > $image_name/Dockerfile
done



