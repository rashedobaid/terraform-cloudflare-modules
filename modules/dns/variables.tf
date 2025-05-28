variable "zone_id" {
  description = "Cloudflare Zone ID for the DNS zone where records will be managed."
  type        = string
}

variable "zone" {
  description = "Domain name for the DNS zone."
  type        = string
}

variable "records" {
  description = "List of DNS records to create"
  type        = list(any)
  default     = []
}