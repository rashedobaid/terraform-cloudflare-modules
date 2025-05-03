variable "zone_id" {
  description = "Cloudflare Zone ID for the DNS zone where records will be managed."
  type        = string
}

variable "a_records" {
  description = "A records to create, mapping hostnames to their IPv4 addresses."
  type = map(object({
    content = string
    ttl     = number
    proxied = optional(bool, true)
    comment = optional(string, "Managed by Terraform")
  }))
  default = {}
}

variable "cname_records" {
  description = "CNAME records to create, mapping subdomains to canonical domain names."
  type = map(object({
    content = string
    ttl     = number
    proxied = optional(bool, true)
    comment = optional(string, "Managed by Terraform")
  }))
  default = {}
}

variable "mx_records" {
  description = "MX records to create, mapping hostnames to mail exchange servers."
  type = map(list(object({
    content  = string
    ttl      = number
    priority = number
    comment  = optional(string, "Managed by Terraform")
  })))
  default = {}
}

variable "srv_records" {
  description = "SRV records to create, used for service discovery such as SIP or XMPP."
  type = map(list(object({
    content  = string
    ttl      = number
    priority = number
    comment  = optional(string, "Managed by Terraform")
  })))
  default = {}
}

variable "txt_records" {
  description = "TXT records to create, commonly used for SPF, DKIM, and domain verification."
  type = map(object({
    content = string
    ttl     = number
    comment = optional(string, "Managed by Terraform")
  }))
  default = {}
}