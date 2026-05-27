# terraformTest

Basic Terraform starter repository for Azure using the AzureRM provider.

This repo is designed for Azure DevOps pipeline testing. It gives you:

- a simple reusable root module
- a basic `modules/app` Terraform module that creates a resource group
- separate `dev` and `prod` environment folders
- an `azure-pipelines.yaml` file with multi-stage `plan` and `apply` jobs
- no credentials or secrets committed to the repository

## Directory structure

```text
.
├── azure-pipelines.yaml
├── env
│   ├── dev
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── prod
│       ├── main.tf
│       ├── terraform.tfvars
│       └── variables.tf
├── main.tf
├── modules
│   └── app
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
└── variables.tf
```

## What gets created

Each environment calls the repo root module, which in turn calls `modules/app`.

The `modules/app` module creates one Azure resource group:

- `dev` default: `terraformtest-dev-rg`
- `prod` default: `terraformtest-prod-rg`

## Usage

### 1. Prerequisites

- Terraform `>= 1.5`
- An Azure subscription
- Azure CLI authentication locally, or an Azure DevOps service connection in pipelines

### 2. Run locally

For dev:

```bash
cd env/dev
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -auto-approve -var-file="terraform.tfvars"
```

For prod:

```bash
cd env/prod
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -auto-approve -var-file="terraform.tfvars"
```

## Azure Pipelines setup

The included `azure-pipelines.yaml` uses two stages:

1. `Dev`
2. `Prod` (runs only after `Dev` succeeds)

Before running the pipeline:

1. Import this repository into Azure DevOps.
2. Create an Azure Resource Manager service connection.
3. Create a pipeline variable named `azureServiceConnection`.
4. Set that variable to the name of your Azure service connection.
5. Run the pipeline.

The pipeline installs Terraform on the hosted agent, then runs:

- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply -auto-approve`

for both environments.

## Security notes

- No credentials, subscription secrets, or backend secrets are stored in this repository.
- The checked-in `terraform.tfvars` files only contain sample non-secret configuration values.
- If your organization wants those values hidden too, replace them with Azure DevOps variables or variable groups and pass them as `TF_VAR_application_name`, `TF_VAR_environment_name`, and `TF_VAR_location`.
