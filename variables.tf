variable "ecr_repo" {
  description = "Name ECR Repo"
  type        = string
}

variable "mantainer" {
  description = "Maintainer"
  type        = string
}

variable "project" {
  description = "Project Code"
  type        = string
}

variable "author" {
  default     = "@mrexojo"
  type        = string
  description = "Author of the module"
}

variable "environment" {
  description = "Environment (dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "scan_on_push" {
  description = "Scan image on push before ecr upload"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Type of encryption for the repository (AES256 or KMS)"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "KMS"], var.encryption_type)
    error_message = "Encryption type must be either AES256 or KMS."
  }
}

variable "kms_key_id" {
  description = "KMS key ARN to use when encryption_type is KMS"
  type        = string
  default     = null
}

variable "allowed_account_ids" {
  description = "List of AWS account IDs allowed to access the repository"
  type        = list(string)
  default     = []
}

variable "use_custom_policy" {
  description = "Whether to use a custom policy instead of the template"
  type        = bool
  default     = false
}

variable "custom_policy" {
  description = "Custom policy to use if use_custom_policy is true"
  type        = string
  default     = null
}

# Policy lifecycle
variable "expire_days" {
  description = "Expire images older than X days"
  type        = number
  default     = 7
}

variable "keep_days" {
  description = "Keep last X images"
  type        = number
  default     = 10
}

# Nuevas variables para características adicionales

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
  type        = string
  default     = "MUTABLE"
  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
    error_message = "Tag mutability must be either MUTABLE or IMMUTABLE."
  }
}

variable "enable_replication" {
  description = "Enable cross-region replication for the repository"
  type        = bool
  default     = false
}

variable "replication_destinations" {
  description = "List of destination repositories for replication"
  type = list(object({
    region      = string
    registry_id = string
  }))
  default = []
}

variable "create_pull_through_cache" {
  description = "Whether to create a pull through cache rule"
  type        = bool
  default     = false
}

variable "pull_through_cache_prefix" {
  description = "The repository name prefix to use for the pull through cache rule"
  type        = string
  default     = ""
}

variable "upstream_registry_url" {
  description = "The upstream registry URL for the pull through cache rule"
  type        = string
  default     = "public.ecr.aws"
}