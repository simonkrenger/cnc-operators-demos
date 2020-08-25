#!/bin/bash
#doitlive speed: 3
#doitlive prompt: [{user}@demo-sdk {dir}]$

# Based on the Quickstart
# https://sdk.operatorframework.io/docs/building-operators/ansible/quickstart/

# Create the project
mkdir simon-operator
cd simon-operator

# Initialise
operator-sdk init --plugins=ansible --domain=krenger.ch

# Create an API
operator-sdk create api --group cnc --version v1 --kind Presentation --generate-role

# Show what is there
tree .

# Copy example task
cp ../main-example.yml roles/presentation/tasks/main.yml

# Show main.yml
vim roles/presentation/tasks/main.yml

# Build the Operator image
make docker-build docker-push IMG=quay.io/simonkrenger/cnc-demo:latest

# Install the CRD
make install

# Deploy the Operator itself
make deploy IMG=quay.io/simonkrenger/cnc-demo:latest

# Show that the Operator is deployed
kubectl get deployment -n simon-operator-system

# Create an instance of the Presentation object
kubectl apply -f config/samples/cnc_v1_presentation.yaml

# Show the presentation
kubectl get presentation

# Show presentation definition
kubectl get presentation -o yaml

# Watch the Operator log for the reconciliation
kubectl logs -f deployment/simon-operator-controller-manager -n simon-operator-system -c manager 

# Get the deployed pods
kubectl get pod -o yaml
