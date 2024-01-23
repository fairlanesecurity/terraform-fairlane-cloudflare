resource "cloudflare_record" "origin_record" {
  zone_id = var.cloudflare_zone_id
  name    = "origin"
  value   = var.origin_ip
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "fairlane_record" {
  zone_id = var.cloudflare_zone_id
  name    = "fairlane"
  value   = "${var.domain}.customer.${var.fairname}"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_worker_route" "fairlane" {
  zone_id     = var.cloudflare_zone_id
  pattern     = "${var.domain}/*"
  script_name = cloudflare_worker_script.fairlane_worker.name
}

resource "cloudflare_worker_route" "fairlane_www" {
  zone_id     = var.cloudflare_zone_id
  pattern     = "www.${var.domain}/*"
  script_name = cloudflare_worker_script.fairlane_worker.name
  count       = var.use_www ? 1 : 0
}

resource "cloudflare_worker_domain" "fairlane" {
  account_id = var.cloudflare_account_id
  zone_id    = var.cloudflare_zone_id
  service    = cloudflare_worker_script.fairlane_worker.name
  hostname   = var.domain
  count      = var.create_worker_domain ? 1 : 0
}

resource "cloudflare_worker_domain" "fairlane_www" {
  account_id = var.cloudflare_account_id
  zone_id    = var.cloudflare_zone_id
  service    = cloudflare_worker_script.fairlane_worker.name
  hostname   = "www.${var.domain}"
  count      = var.create_worker_domain && var.use_www ? 1 : 0
}
