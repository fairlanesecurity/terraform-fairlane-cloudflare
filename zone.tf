resource "cloudflare_record" "fairlane_record" {
  zone_id = var.cloudflare_zone_id
  name    = "fairlane"
  content = "${var.domain}.customer.${local.fairlane_domain}"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_workers_route" "fairlane" {
  count       = var.create_worker_routes ? 1 : 0
  zone_id     = var.cloudflare_zone_id
  pattern     = "${var.domain}/*"
  script_name = cloudflare_workers_script.fairlane_worker.name
}

resource "cloudflare_workers_route" "fairlane_record_www" {
  count       = var.create_worker_routes && var.use_www ? 1 : 0
  zone_id     = var.cloudflare_zone_id
  pattern     = "www.${var.domain}/*"
  script_name = cloudflare_workers_script.fairlane_worker.name
}
