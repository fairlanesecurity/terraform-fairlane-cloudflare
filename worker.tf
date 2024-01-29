resource "cloudflare_worker_script" "fairlane_worker" {
  account_id = var.cloudflare_account_id
  name       = "${local.safe_name}-fairlane-worker"
  content    = data.http.worker_script.response_body
  module     = true
  logpush    = true

  plain_text_binding {
    name = "WORKER_LINK"
    text = var.fairlane_worker_url
  }

  plain_text_binding {
    name = "FAIRLANE_RECORD"
    text = "${cloudflare_record.fairlane_record.name}.${var.domain}"
  }

  plain_text_binding {
    name = "CUSTOMER_ID"
    text = var.fairlane_customer_id
  }

  secret_text_binding {
    name = "API_TOKEN"
    text = var.fairlane_api_token
  }

  secret_text_binding {
    name = "LICENCE_KEY"
    text = var.fairlane_licence_key
  }

  plain_text_binding {
    name = "CLOUDFLARE_WORKER_NAME"
    text = "${local.safe_name}-fairlane-worker"
  }

  plain_text_binding {
    name = "CLOUDFLARE_ACCOUNT_ID"
    text = var.cloudflare_account_id
  }

  secret_text_binding {
    name = "CLOUDFLARE_API_TOKEN"
    text = var.cloudflare_api_token
  }

  secret_text_binding {
    name = "ENCRYPTION_SECRET"
    text = var.encryption_secret
  }
}

resource "cloudflare_worker_cron_trigger" "auto_update" {
  count       = var.auto_update ? 1 : 0
  account_id  = var.cloudflare_account_id
  script_name = cloudflare_worker_script.fairlane_worker.name
  schedules = [
    var.auto_update_schedule,
  ]
}
