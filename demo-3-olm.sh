#!/bin/bash
#doitlive speed: 3
#doitlive prompt: [{user}@demo-olm {dir}]$

# Show that OLM is running
kubectl get po -n openshift-operator-lifecycle-manager

# Show OLM subscriptions
kubectl get subscription --all-namespaces

# Inspect the Subscription for Kafka
kubectl get subscription strimzi-kafka-operator -n openshift-operators -o yaml | grep -A7 -e "^spec:"

# Get ClusterServiceVersions (shows details on what the Operator provides)
kubectl get ClusterServiceVersion

# Show GUI for OLM
google-chrome https://console-openshift-console.apps.operatordemo.lab.upshift.rdu2.redhat.com/k8s/all-namespaces/operators.coreos.com~v1alpha1~ClusterServiceVersion
