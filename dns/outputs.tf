# Terragrunt dependency: output.record_name["1"]
output "record_name" {
  description = "The names of all Cloudflare DNS records."
  value = {
    for record_key, record in cloudflare_dns_record.records : record_key => record.name
  }
}

# Terragrunt dependency: output.record_value["1"]
output "record_value" {
  description = "The records of all Cloudflare DNS records."
  value = {
    for record_key, record in cloudflare_dns_record.records : record_key => record.content
  }
}