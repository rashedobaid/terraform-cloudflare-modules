output "dns_record_resource_names" {
  value = [for name, _ in local.records : "cloudflare_dns_record.records[\"${name}\"]"]
}
