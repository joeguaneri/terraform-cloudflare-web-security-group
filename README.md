# Terraform Module for Security Group with Cloudflare IPs

This module creates a security group that whitelists all the cloudflare ipv4 and ipv6 ip ranges.  This is useful to limit access to resources that should utilize the Cloudflare proxy service exclusively.

## Usage

```terraform
module cloudflare_security_group {
  source = "github.com/joeguaneri/terraform-cloudflare-web-security-group.git"

  vpc_id = aws_vpc.vpc.id

  providers = {
    cloudflare = cloudflare
  }
}

resource "aws_lb" "public_lb" {
  ...
  security_groups = [module.cloudflare_security_group.security_group_id]
```

## Prerequisites
This module requires the Cloudflare provider be used
```terraform
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
```
A Cloudflare account is required and an API token can be generated based on the documentation here: https://developers.cloudflare.com/fundamentals/api/get-started/create-token/