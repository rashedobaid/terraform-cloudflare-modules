output "zone_id" {
  value = cloudflare_zone.domain.id
}

output "name_servers" {
  value = cloudflare_zone.domain.name_servers
}