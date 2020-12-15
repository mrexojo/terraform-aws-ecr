# terraform-aws-ecr

### Terraform module to create AWS ECR with customized policy


 Requirement variables:

- ecr_repo : Name of repository to create
- mantainer: mantainer operator
- project: Name or code project



 Default parameters (not required to set):

- scan_on_push: Scan image on push before ecr upload (default true)
- expire_days: Expire images older than X days (default 3)
- keep_days: Keep last X images (default 10)

### Usage

```
module "terraform-module-ecr" {
  source    = "git::ssh://git@github.com/mrexojo/terraform-aws-ecr?ref=v0.0.1"
  ecr_repo  = var.env_ecr_repo
  mantainer = var.env_mantainer
  project   = var.env_project
}
````
note: This module assume that you has configured aws and region properly

