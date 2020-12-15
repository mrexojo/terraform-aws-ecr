# ECR Configuration template:
# - ECR Repository
# - ECR Policy
# - ECR Lifecycle Policy
# Author: @mrexojo 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository


resource "aws_ecr_repository" "ecr-repository" {
  name = var.ecr_repo
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
    
  }
  tags = {
    "Name"      = var.ecr_repo
    "Mantainer" = var.mantainer
    "Project"   = var.project
    "Author"    = var.author
  }
}

resource "aws_ecr_repository_policy" "ecr-repository-policy" {
  repository = aws_ecr_repository.ecr-repository.name
  policy     = templatefile("${path.module}/policy.json.tpl", { sid_name = var.ecr_repo })
}

resource "aws_ecr_lifecycle_policy" "ecr-lifecycle-policy" {
  repository = aws_ecr_repository.ecr-repository.name
  policy = templatefile(
    "${path.module}/policy-lifecycle.json.tpl",
    { expire = var.expire_days, keep = var.keep_days }
  )
  
}

