#!/bin/sh
kops edit ig nodes --name $NAME
kops edit ig $(kops get ig --name $NAME | grep "Master" | cut -f1) --name $NAME
kops update cluster $NAME --yes
