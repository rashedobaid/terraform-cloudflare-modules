output "dns_records" {
  description = "The list of Cloudflare DNS records created."
  value = cloudflare_dns_record.records
}

output "dns_record_names" {
  description = "The names of all Cloudflare DNS records created."
  value = [for record in cloudflare_dns_record.records : record.name]
}

output "dns_record_content" {
  description = "The content of all Cloudflare DNS records created."
  value = [for record in cloudflare_dns_record.records : record.content]
}

output "dns_record_types" {
  description = "The types of all Cloudflare DNS records created."
  value = [for record in cloudflare_dns_record.records : record.type]
}

output "dns_record_fqdn" {
  description = "The fully qualified domain names (FQDNs) of the Cloudflare DNS records created."
  value = [for record in cloudflare_dns_record.records : record.fqdn]
}

output "dns_record_ttl" {
  description = "The TTL values for all Cloudflare DNS records created."
  value = [for record in cloudflare_dns_record.records : record.ttl]
}

output "dns_record_proxied" {
  description = "The proxied status (true/false) for each Cloudflare DNS record created."
  value = [for record in cloudflare_dns_record.records : record.proxied]
}

output "dns_record_priority" {
  description = "The priority for each MX record created."
  value = [
    for record in cloudflare_dns_record.records : 
    record.type == "MX" ? record.priority : null
  ]
  sensitive = true  # Mark as sensitive if you'd like to protect the priority values
}