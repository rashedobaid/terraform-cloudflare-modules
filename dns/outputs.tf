output "dns_record_ids" {
  description = "The IDs of the Cloudflare DNS records."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.id
  }
}

output "dns_record_created_on" {
  description = "Timestamps when each DNS record was created."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.created_on
  }
}

output "dns_record_modified_on" {
  description = "Timestamps when each DNS record was last modified."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.modified_on
  }
}

output "dns_record_comment_modified_on" {
  description = "Timestamps when each DNS record's comment was last modified (if any)."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.comment_modified_on
  }
}

output "dns_record_tags_modified_on" {
  description = "Timestamps when each DNS record's tags were last modified (if any)."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.tags_modified_on
  }
}

output "dns_record_meta" {
  description = "Cloudflare-specific meta information about each record."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.meta
  }
}

output "dns_record_proxiable" {
  description = "Whether each record can be proxied by Cloudflare."
  value = {
    for k, record in cloudflare_dns_record.records :
    k => record.proxiable
  }
}