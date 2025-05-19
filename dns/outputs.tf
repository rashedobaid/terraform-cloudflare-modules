output "record_hostnames_to_ids" {
  description = "A map of the zone record hostnames to IDs."
  value = {
    for record_key, record in cloudflare_dns_record.records :
    (record.name == "@" ? var.zone : "${record.name}.${var.zone}") => record.id
  }
}