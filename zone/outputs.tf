output "zone_id" {
  value = cloudflare_zone.domain.id
}

output "name_servers" {
  value = cloudflare_zone.domain.name_servers
}

# DNSSEC
# output "dnssec_id" {
#   description = "DNSSEC ID of the zone"
#   value       = length(cloudflare_dns_record.dnssec) > 0 ? cloudflare_dns_record.dnssec[0].id : null
# }
