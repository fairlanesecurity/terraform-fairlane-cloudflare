variable "fairlane_customer_id" {
  type        = string
  description = "Unique identifier for Fairlane customers."
}

variable "fairlane_api_token" {
  type        = string
  description = "API token for authenticating with the Fairlane service."
  sensitive   = true
}

variable "fairlane_licence_key" {
  type        = string
  description = "License key required for Fairlane integration."
  sensitive   = true
}

variable "fairlane_worker_url" {
  type        = string
  description = "URL for the Fairlane worker."
}

variable "cloudflare_account_id" {
  type        = string
  description = "Identifier for the Cloudflare account."
}

variable "cloudflare_api_token" {
  type        = string
  description = "API token for authenticating with the Cloudflare service."
  sensitive   = true
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Identifier for the Cloudflare zone."
}

variable "origin_ip" {
  type        = string
  description = "IP address of the origin server."

  validation {
    condition     = can(regex("^\\b(?:\\d{1,3}\\.){3}\\d{1,3}\\b", var.origin_ip))
    error_message = "Invalid IPv4 address format. Please provide a valid IPv4 address."
  }
}

variable "domain" {
  type        = string
  description = "Primary domain without the 'www.' prefix."

  validation {
    condition     = can(regex("^([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$", var.domain))
    error_message = "Invalid domain format. Please provide a valid domain like example.com."
  }
}

variable "create_worker_domain" {
  type        = bool
  default     = false
  description = "Boolean indicating whether to create a worker domain. Defaults to false."
}

variable "use_www" {
  type        = bool
  default     = true
  description = "Boolean indicating whether to include 'www.' in the domain."
}

variable "auto_update" {
  type        = bool
  default     = true
  description = "Boolean value to enable or disable auto-updates."
}

variable "auto_update_schedule" {
  type        = string
  default     = "*/5 * * * *" # every 5 minutes
  description = "Cron schedule for auto-updates."

  validation {
    condition     = can(regex("^(\\S+\\s+){4}\\S+$", var.auto_update_schedule))
    error_message = "Invalid cron schedule format. Please provide a valid cron expression."
  }
}

variable "encryption_secret" {
  type        = string
  description = "256-bit secret key used for encryption."
  sensitive   = true
}
