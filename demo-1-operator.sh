#!/bin/bash
#doitlive speed: 3
#doitlive prompt: [{user}@cnc-demo {dir}]$

# Show installed Cluster Operators
kubectl get clusterserviceversion

# Show that Kafka CRDs exist
kubectl get crd | grep "strimzi"

# Show Kafka object
cat kafka-simple.yml

# Apply and watch
kubectl apply -f kafka-simple.yml
kubectl get kafka
kubectl get pods -w

# Edit the version
kubectl edit kafka my-cluster
kubectl get pods -w

# Kafka Topic, apply and watch
cat kafka-topic.yml
kubectl apply -f kafka-topic.yml
kubectl get kafkatopic
