# Overview
This project is used to demonstrate how to use Terraform to manage Helm charts / Operators / Objects in Kubernetes in local


## instruction

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