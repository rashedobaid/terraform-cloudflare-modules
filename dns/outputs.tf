output "resource_addresses_to_ids" {
  description = "A map of fully qualified Terraform resource addresses to their corresponding Cloudflare DNS record IDs. Useful for referencing specific resources in Terraform state or scripts."
  value = {
    for record_key, record in cloudflare_dns_record.default :
    "cloudflare_dns_record.default[\"${record_key}\"]" => record.id
  }
}

output "dns_record_ids" {
  description = "A map of logical DNS record keys (as defined in the input variable or generated key) to their Cloudflare-assigned DNS record IDs."
  value = {
    for k, record in cloudflare_dns_record.default :
    k => record.id
  }
}
