#!/bin/bash
cephcsi=k8s.gcr.io/sig-storage/csi-provisioner:v2.0.4,k8s.gcr.io/sig-storage/csi-snapshotter:v4.0.0,k8s.gcr.io/sig-storage/csi-attacher:v3.0.2,k8s.gcr.io/sig-storage/csi-resizer:v1.0.1,quay.io/cephcsi/cephcsi:v3.3.1,k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.0.1

IFS=","
for i in $cephcsi
do
    image_name=$(echo $i|awk -F : '{print $1}'|awk -F / '{print $NF}')
    mkdir -p $image_name
    echo "FORM $i" > $image_name/Dockerfile
done



