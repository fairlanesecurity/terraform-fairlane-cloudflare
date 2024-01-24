variable "fairlane_customer_id" {
  type = string
}

variable "fairlane_api_token" {
  type = string
}

variable "fairlane_licence_key" {
  type = string
}

variable "fairlane_worker_url" {
  type = string
}

variable "cloudflare_account_id" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

variable "origin_ip" {
  type = string
}

variable "domain" {
  type = string
}

variable "fairname" {
  type    = string
  default = "fairlane.cloud"
}

variable "create_worker_domain" {
  type    = bool
  default = false
}

variable "use_www" {
  type    = bool
  default = true
}

variable "auto_update" {
  type    = bool
  default = true
}

variable "auto_update_schedule" {
  type    = string
  default = "*/5 * * * *" # every 5 minutes
}

variable "encryption_secret" {
  type = string
}
