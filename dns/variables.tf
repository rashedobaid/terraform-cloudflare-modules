variable "zone_id" {
  description = "Cloudflare Zone ID for the DNS zone where records will be managed."
  type        = string
}

variable "zone" {
  description = "Domain name for the DNS zone."
  type        = string
}

# DNS Records
variable "records" {
  description = "List of DNS records to create"
  type        = list(any)
  default     = []
}

# DNSSEC
variable "dnssec" {
  description = "Enable DNSSEC multi-signer"
  type        = bool
  default     = null
}

variable "dnssec_presigned" {
  description = "Enable DNSSEC presigned"
  type        = bool
  default     = null
}

variable "status" {
  description = "Desired DNSSEC status: 'active' or 'disabled'."
  type        = string
  default     = "active"
  validation {
    condition     = contains(["active", "disabled"], var.status)
    error_message = "status must be either 'active' or 'disabled'."
  }
}