locals {
  processed_records = [
    for r in var.records : {
      name     = r.name == "@" || r.name == "root" ? "" : r.name
      type     = r.type
      content  = r.value
      ttl      = r.ttl
      proxied  = r.proxied != null ? r.proxied : true
      priority = r.type == "MX" ? r.priority : null
      comment  = r.comment
    }
  ]
}

resource "cloudflare_dns_record" "records" {
  for_each = {
    for idx, record in local.processed_records : idx => record
  }

  zone_id = var.zone_id
  name    = each.value.name != "" ? "${each.value.name}.${var.zone}" : var.zone
  type    = each.value.type
  content = each.value.content
  ttl     = each.value.ttl

  proxied  = contains(["A", "CNAME"], each.value.type) ? lookup(each.value, "proxied", true) : null
  priority = each.value.type == "MX" ? lookup(each.value, "priority", null) : null
  comment  = each.value.comment
}
