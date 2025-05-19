resource "cloudflare_zone_dnssec" "default" {
  count = var.dnssec == null && var.dnssec_presigned == null ? 0 : 1

  zone_id             = var.zone_id
  dnssec_multi_signer = var.dnssec
  dnssec_presigned    = var.dnssec_presigned
  status              = var.status
}

resource "cloudflare_dns_record" "default" {
  for_each = length(cloudflare_zone_dnssec.dnssec) > 0 ? {
    "dnssec" = cloudflare_zone_dnssec.dnssec[0]
  } : {}

  zone_id = var.zone_id
  name    = var.zone
  type    = "DS"
  ttl     = 1
  data = {
    key_tag     = each.value.key_tag
    algorithm   = each.value.algorithm
    digest_type = each.value.digest_type
    digest      = each.value.digest
  }
  comment = "Cloudflare DNSSEC"
}