locals {
  safe_name       = replace(var.domain, ".", "-")
  fairlane_domain = "fairlane.cloud"
}
