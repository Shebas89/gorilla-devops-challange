# gorilla-devops-challange

## Description
This repo was create to deploy the infrastructure needed to run # into AWS. This is a IaC repository using terragrunt to deploy the infra in different environment

## Terraform Version
This repository was developed to run with:

Terraform: 1.2.9
Terragrunt: v0.35.16

The Dockerfile contain the version used to deploy the infrastructure.

## terragrunt commands
This repo was written to use the DRY principe, for this reason there is three folders in the main, the module folder contains all modules used by Terragrunt, services folder contains all the modules calls need for the deployment, and finally, the deployment contains the following structure 
Deployment/<region>/<environment>/<service>
Each service contains a terragrunt file that initialize the terragrun and terraform files.
Some services contain a dependency call that helps to get the services outputs to be used in a specific service.

## Terragrunt commands
Terragrunt commands available to be run in this repository, can be found in this page https://terragrunt.gruntwork.io/docs/reference/cli-options/
The terragrunt commands need to be ran in specific service. Eg:
cd /apps/deployments/us-east-1/common/vpc
terragrunt init
terragrunt plan
terragrunt apply
