# Overview
This project is used to demonstrate how to use Terraform to manage Helm charts / Operators / Objects in Kubernetes in local

## Components

This repo will install these components into the cluster

- Tekton Operator 

### Tekton Operator

to access Tekton dashbaord locally, we need to port-forward:

`kubectl port-forward svc/tekton-dashboard 9097:9097`

## Instruction

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
terraform apply
```