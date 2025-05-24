resource "cloudflare_ruleset" "ruleset" {
  for_each = var.rulesets

  name    = each.key
  kind    = each.value.kind
  phase   = each.value.phase
  zone_id = var.zone_id
  rules   = each.value.rules
}

variable "zone_id" {
  type = string
}

variable "rulesets" {
  description = "Map of ruleset names to their phase and rules"
  type = map(object({
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


inputs = {
  zone_id = "your-zone-id"

  rulesets = {
    "default" = {
      kind  = "zone"
      phase = "http_request_dynamic_redirect"
      rules = [
        {
          action      = "redirect"
          expression  = "(http.host eq \"${input.zone}\")"
          description = "Redirect to Gravatar"
          enabled     = true
          action_parameters = {
            from_value = {
              preserve_query_string = true
              target_url = {
                expression = "concat(\"https://gravatar.com/robaidae\", http.request.uri.path)"
              }
              status_code = 301
            }
          }
        }
      ]
    }
  }
}

