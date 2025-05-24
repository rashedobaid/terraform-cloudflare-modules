resource "cloudflare_ruleset" "ruleset" {
  for_each = var.rulesets

  name    = each.key
  kind    = each.value.kind
  phase   = each.value.phase
  zone_id = var.zone_id
  rules   = each.value.rules
}