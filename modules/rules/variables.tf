variable "zone_id" {
  description = "Cloudflare Zone ID for the DNS zone where records will be managed."
  type        = string
}

variable "rulesets" {
  description = "Map of ruleset names to their phase and rules"
  type = map(object({
    name  = string
    kind  = string
    phase = string
    rules = optional(list(object({
      action                   = string
      expression               = string
      description              = optional(string)
      enabled                  = optional(bool)
      action_parameters        = optional(any)
      categories               = optional(list(string))
      exposed_credential_check = optional(any)
      logging                  = optional(any)
      ratelimit                = optional(any)
      ref                      = optional(string)
    })), [])
  }))
}
