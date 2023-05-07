#!/bin/bash
#

componments=(queue activator autoscaler controller domain-mapping domain-mapping-webhook webhook)

for c in ${componments[@]}
do
    echo $c
    podman pull registry.cn-hangzhou.aliyuncs.com/cloudee/knative-${c}:v1.10.0
    podman tag registry.cn-hangzhou.aliyuncs.com/cloudee/knative-${c}:v1.10.0 ccr.ccs.tencentyun.com/cloudee/knative-${c}:v1.10.0
    podman push ccr.ccs.tencentyun.com/cloudee/knative-${c}:v1.10.0
done
