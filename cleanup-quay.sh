#!/bin/bash

oc delete -f quay-cr.yaml
oc delete -f quay-sub.yaml
oc delete -f quay-namespace.yaml

