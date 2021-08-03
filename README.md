# Overview
This project is used to demonstrate how to use Terraform to manage Helm charts / Operators / Objects in Kubernetes in local

## Approach

For this repo

1) We will need to provision the cluster locally and install Tekton Operator first
2) After that we will configure the Tekton pipeline to automaticaly read the repository and make this repository part of the CI. so, everytime the code change, it will rebuild the infrastructure.

## Components

This repo will install these components into the cluster

- Tekton Operator 

### Tekton Operator

to access Tekton dashbaord locally, we need to port-forward:

`kubectl port-forward svc/tekton-dashboard 9097:9097`

## Initial Instruction

- create a cluster by running
```
kind create cluster --config multi-workers.yaml
```

- initial terraform provider by running

```
terraform init
```

- plan the infra

```
terraform plan
```

- apply to local cluster by 

```
terraform apply -auto-approve
```

run the tekton terraform pipeline via

```
tkn pipeline start local-infrastructure-pipeline --param repo="https://github.com/InsomniaCoder/tf-local" -w name=local,emptyDir=
```