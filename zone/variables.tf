# Zone
variable "account_id" {
  description = "ID of the Account"
  type        = string
}

variable "zone" {
  description = "Domain name"
  type        = string
}

variable "ssl_level" {
  description = "SSL level for the domain"
  type        = string
  default     = "strict"
}

# DNSSEC
variable "dnssec" {
  description = "Enable DNSSEC"
  type        = bool
  default     = null
}

variable "dnssec_presigned" {
  description = "Enable DNSSEC presigned"
  type        = bool
  default     = null
}

variable "dnssec_multi_signer" {
  description = "Enable DNSSEC multi-signer"
  type        = bool
  default     = null
}