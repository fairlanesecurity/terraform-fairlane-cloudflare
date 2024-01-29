# terraform-fairlane-cloudflare

Main repository for the terraform-fairlane-cloudflare module

## Example

```
module "consufair-lane" {
  source = "github.com/fairlanesecurity/terraform-fairlane-cloudflare"

  fairlane_customer_id = "1"
  fairlane_api_token = "abc"
  fairlane_licence_key = "123"
  fairlane_worker_url = "https://fairlane.dev/fwu.ts"

  encryption_secret = base64encode(random_password.encryption_secret.result)

  cloudflare_account_id = "1x4mpl3"
  cloudflare_api_token = "ExAmPle"
  cloudflare_zone_id = "1337f"

  domain = "fairlane.dev"

  create_worker_routes = true
  use_www = true
}

resource "random_password" "encryption_secret" {
  length  = 32
  special = true
}
```

## Variables

| Variable name           | Type      | Required / Optional | Default       | Description                                                 |
| ----------------------- | --------- | ------------------- | ------------- | ----------------------------------------------------------- |
| `fairlane_customer_id`  | `string`  | Required            | -             | Unique identifier for Fairlane customers.                   |
| `fairlane_api_token`    | `string`  | Required            | -             | API token for authenticating with the Fairlane service.     |
| `fairlane_licence_key`  | `string`  | Required            | -             | License key required for Fairlane integration.              |
| `fairlane_worker_url`   | `string`  | Required            | -             | URL for the Fairlane worker.                                |
| `cloudflare_account_id` | `string`  | Required            | -             | Identifier for the Cloudflare account.                      |
| `cloudflare_api_token`  | `string`  | Required            | -             | API token for authenticating with the Cloudflare service.   |
| `cloudflare_zone_id`    | `string`  | Required            | -             | Identifier for the Cloudflare zone of the domain.           |
| `origin_ip`             | `string`  | Required            | -             | IP address of the origin server.                            |
| `domain`                | `string`  | Required            | -             | Primary domain without the 'www.' prefix.                   |
| `encryption_secret`     | `string`  | Required            | -             | 256-bit secret key used for encryption.                     |
| `create_worker_routes`  | `boolean` | Optional            | `false`       | Boolean indicating whether to create a worker domain.       |
| `use_www`               | `boolean` | Optional            | `true`        | Boolean indicating whether to include 'www.' in the domain. |
| `auto_update`           | `boolean` | Optional            | `true`        | Boolean value to enable or disable auto-updates.            |
| `auto_update_schedule`  | `string`  | Optional            | `*/5 * * * *` | Cron schedule for auto-updates.                             |
