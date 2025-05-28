locals {
  records = length(var.records) > 0 ? {
    for idx, record in var.records :
    try(record.key, format("%s-%s-%s", tostring(record.name), tostring(record.type), tostring(record.content))) => merge(
      record,
      {
        fqdn  = record.name == "@" ? var.zone : "${record.name}.${var.zone}"
        value = record.content
      }
    )
  } : {}
}

resource "cloudflare_dns_record" "records" {
  for_each = local.records

  zone_id  = var.zone_id
  name     = each.value.fqdn
  type     = each.value.type
  content  = each.value.value
  ttl      = lookup(each.value, "ttl", 1)
  proxied  = lookup(each.value, "proxied", false)
  priority = lookup(each.value, "priority", null)
  comment  = lookup(each.value, "comment", null)
}
