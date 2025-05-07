# ECR Configuration template:
# - ECR Repository with encryption and image scanning
# - ECR Repository Policy with restricted access 
# - ECR Lifecycle Policy
# - Image Mutability Settings
# - Replication Configuration
# Author: @mrexojo
# Last update: May 2025 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository


resource "aws_ecr_repository" "ecr-repository" {
  name = var.ecr_repo

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.encryption_type == "KMS" ? var.kms_key_id : null
  }

  # Opcionalmente evita que las imágenes etiquetadas puedan sobrescribirse
  image_tag_mutability = var.image_tag_mutability

  tags = {
    Name        = var.ecr_repo
    Maintainer  = var.mantainer
    Project     = var.project
    Author      = var.author
    Environment = var.environment
    CreatedBy   = "Terraform"
  }
}

resource "aws_ecr_repository_policy" "ecr-repository-policy" {
  repository = aws_ecr_repository.ecr-repository.name
  policy = var.use_custom_policy ? var.custom_policy : templatefile("${path.module}/policy.json.tpl", {
    sid_name    = var.ecr_repo,
    account_ids = jsonencode(var.allowed_account_ids)
  })
}

resource "aws_ecr_lifecycle_policy" "ecr-lifecycle-policy" {
  repository = aws_ecr_repository.ecr-repository.name
  policy = templatefile(
    "${path.module}/policy-lifecycle.json.tpl",
    { expire = var.expire_days, keep = var.keep_days }
  )
}

# Configuración de replicación (opcional)
resource "aws_ecr_replication_configuration" "replication" {
  count = var.enable_replication ? 1 : 0

  replication_configuration {
    rule {
      dynamic "destination" {
        for_each = var.replication_destinations
        content {
          region      = destination.value.region
          registry_id = destination.value.registry_id
        }
      }
    }
  }
}

# Pull Through Cache Rule (opcional)
resource "aws_ecr_pull_through_cache_rule" "pull_through" {
  count = var.create_pull_through_cache ? 1 : 0

  ecr_repository_prefix = var.pull_through_cache_prefix
  upstream_registry_url = var.upstream_registry_url
}

