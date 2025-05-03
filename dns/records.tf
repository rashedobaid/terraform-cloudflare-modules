locals {
  records = merge(
    { for name, r in var.a_records : "${name}_A" => {
      name    = name
      type    = "A"
      content = r.content
      ttl     = r.ttl
      proxied = r.proxied
      comment = r.comment
    } },

    { for name, r in var.cname_records : "${name}_CNAME" => {
      name    = name
      type    = "CNAME"
      content = r.content
      ttl     = r.ttl
      proxied = r.proxied
      comment = r.comment
    } },

    { for name, r in var.srv_records : "${name}_SRV" => {
      name    = name
      type    = "SRV"
      content = r.content
      ttl     = r.ttl
      proxied = r.proxied
      comment = r.comment
    } },

    merge([
      for name, rs in var.mx_records : {
        for idx, r in rs :
        "${name}_MX_${idx}" => {
          name     = name
          type     = "MX"
          content  = r.content
          ttl      = r.ttl
          priority = r.priority
          comment  = r.comment
        }
      }
    ]...),

    { for name, r in var.txt_records : "${name}_TXT" => {
      name    = name
      type    = "TXT"
      content = r.content
      ttl     = r.ttl
      comment = r.comment
    } }
  )
}

resource "cloudflare_dns_record" "records" {
  for_each = local.records

  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  content = each.value.content
  ttl     = each.value.ttl

  proxied  = contains(["A", "CNAME"], each.value.type) ? lookup(each.value, "proxied", true) : null
  priority = each.value.type == "MX" ? lookup(each.value, "priority", null) : null
  comment  = each.value.comment
}