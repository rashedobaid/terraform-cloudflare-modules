output "record_hostnames_to_ids" {
  description = "A map of the zone record key to IDs."
  value = {
    for record_key, record in cloudflare_dns_record.records :
    record_key => record.id
  }
}