variable "ecr_repo" {
  description = "Name ECR Repo"
}

variable "mantainer" {
  description = "Mantainer"

}
variable "project" {
  description = "Project Code"

}
variable "author" {
  default = "@mrexojo"

}

variable "scan_on_push" {
  description = "Scan image on push before ecr upload"
  type        = bool
  default     = true
}
#Policy lifecycle
variable "expire_days" {
  description = "Expire images older than X days"
  type        = number
  default     = 3
}

variable "keep_days" {
  description = "Keep last X images"
  type        = number
  default     = 10
}