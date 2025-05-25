output "zone_id" {
  value = cloudflare_zone.domain.id
}

output "zone" {
  value = cloudflare_zone.domain.name
}

output "name_servers" {
  value = cloudflare_zone.domain.name_servers
}