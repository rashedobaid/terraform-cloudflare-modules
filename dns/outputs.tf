output "resource_addresses_to_ids" {
  description = "Map of resource addresses to Cloudflare record IDs, with quoted keys."
  value = {
    for record_key, record in cloudflare_dns_record.records :
    "cloudflare_dns_record.records[" + "\"" + record_key + "\"" + "]" => record.id
  }
}

output "dns_record_ids" {
  description = "A map of logical DNS record keys (as defined in the input variable or generated key) to their Cloudflare-assigned DNS record IDs."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.id
  }
}
