resource "cloudflare_zone" "domain" {
  account = {
    id = var.account_id
  }
  name = var.zone
}

resource "cloudflare_zone_setting" "domain" {
  zone_id    = cloudflare_zone.domain.id
  setting_id = "ssl"
  id         = "ssl"
  value      = var.ssl_level
}