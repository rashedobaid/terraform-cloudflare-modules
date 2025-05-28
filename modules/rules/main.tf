resource "cloudflare_ruleset" "ruleset" {
  for_each = var.rulesets

  name    = each.value.name
  kind    = each.value.kind
  phase   = each.value.phase
  zone_id = var.zone_id
  rules   = each.value.rules
}