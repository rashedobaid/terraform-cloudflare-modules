variable "account_id" {
  description = "ID of the Account"
  type        = string
}

variable "domain" {
  description = "Domain name"
  type        = string
}

variable "ssl_level" {
  description = "SSL level for the domain"
  type        = string
  default     = "strict"
}