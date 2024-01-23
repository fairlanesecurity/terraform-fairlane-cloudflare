# terraform-fairlane-cloudflare
Main repository for the terraform-fairlane-cloudflare module

# Example
```
module "consufair-lane" {
  source = "../terraform-fairlane-cloudflare"

  fairlane_customer_id = "1"
  fairlane_api_token = "abc"
  fairlane_licence_key = "123"
  fairlane_worker_url = "https://fairlane.dev/fwu.ts"

  cloudflare_account_id = "1x4mpl3"
  cloudflare_api_token = "ExAmPle"
  cloudflare_zone_id = "1337f"

  origin_ip = "1.3.3.7"
  domain = "fairlane.dev"

  create_worker_domain = true
  use_www = true
}
```