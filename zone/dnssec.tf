resource "cloudflare_zone_dnssec" "dnssec" {
  count = var.dnssec == true ? 1 : 0

  zone_id             = cloudflare_zone.domain.id
  dnssec_multi_signer = var.dnssec_multi_signer
  dnssec_presigned    = var.dnssec_presigned
}

# resource "cloudflare_dns_record" "dnssec" {
#   count = length(cloudflare_zone_dnssec.dnssec) > 0 ? 1 : 0

#   zone_id = cloudflare_zone.domain.id
#   name    = cloudflare_zone.domain.name
#   type    = "DS"
#   ttl     = 1
#   data = {
#     key_tag     = cloudflare_zone_dnssec.dnssec[0].key_tag
#     algorithm   = cloudflare_zone_dnssec.dnssec[0].algorithm
#     digest_type = cloudflare_zone_dnssec.dnssec[0].digest_type
#     digest      = cloudflare_zone_dnssec.dnssec[0].digest
#   }
#   comment = "Cloudflare DNSSEC"

#   depends_on = [cloudflare_zone_dnssec.dnssec]
# }