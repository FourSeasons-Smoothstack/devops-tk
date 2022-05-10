variable "AWS_ACCESS_KEY" {
    description = "AWS Access Key"
    type        = string
    sensitive   = true
}
variable "AWS_SECRET_KEY" {
    description = "AWS Secret Key"
    type        = string
    sensitive   = true
}
variable "RDS_PASSWORD" {
    description = "Database administrator password"
    type        = string
    sensitive   = true
}
variable "AWS_REGION" {
    description = "AWS region"
    type        = string
    sensitive   = false
}