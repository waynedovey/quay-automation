#!/bin/bash

oc apply -f quay-namespace.yaml
oc create secret generic -n quay --from-file config.yaml=config.yaml config-bundle-secret

oc apply -f quay-sub.yaml


# Check progress of the Operator
until oc get csv -n quay | grep -i quay-operator | grep Succeeded 2> /dev/null
do
    echo echo "Wait for Operator Installation"
    sleep 10
done

oc apply -f quay-cr.yaml
