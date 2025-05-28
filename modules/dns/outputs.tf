output "dns_record_ids" {
  description = "A map of logical DNS record keys (as defined in the input variable or generated key) to their Cloudflare-assigned DNS record IDs."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.id
  }
}