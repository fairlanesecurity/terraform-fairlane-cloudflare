resource "cloudflare_logpush_job" "fairlane_logpush" {
  name             = "fairlane-logpush"
  dataset          = "workers_trace_events"
  destination_conf = "https://api.botmanagement.com/api/logs/cloudflare/worker?header_X-Auth-Customer-Id=${var.fairlane_customer_id}&header_X-Auth-Token=${var.fairlane_api_token}&header_Content-Type=application%2Fjson"
  logpull_options  = "fields=DispatchNamespace,Event,EventTimestampMs,EventType,Exceptions,Logs,Outcome,ScriptName,ScriptTags&timestamps=rfc3339"
  enabled          = true
  account_id       = var.cloudflare_account_id
  filter           = "{\"where\":{\"and\":[{\"and\":[{\"key\":\"ScriptName\",\"operator\":\"eq\",\"value\":\"${cloudflare_workers_script.fairlane_worker.name}\"}]}]}}"
}
