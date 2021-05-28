# terraform-aws-client-vpn

[![Lint Status](https://github.com/DNXLabs/terraform-aws-client-vpn/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-client-vpn/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-client-vpn)](https://github.com/DNXLabs/terraform-aws-client-vpn/blob/master/LICENSE)

This terraform module installs a client vpn.

The following resources will be created:
 - VPN Endpoint - Provides an AWS Client VPN endpoint for OpenVPN clients.
 - Provides network associations for AWS Client VPN endpoints
 - Generate AWS Certificate Manager(ACM) certificates

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr | Network CIDR to use for clients | `any` | n/a | yes |
| dns\_servers | list of dns servers to use | `list(string)` | <pre>[<br>  "",<br>  ""<br>]</pre> | no |
| logs\_retention | Retention in days for CloudWatch Log Group | `number` | `365` | no |
| name | Name prefix for the resources of this stack | `any` | n/a | yes |
| organization\_name | Name of organization to use in private certificate | `string` | `"ACME, Inc"` | no |
| split\_tunnel | Indicates whether split-tunnel is enabled on VPN endpoint | `bool` | `false` | no |
| subnet\_ids | Subnet ID to associate clients | `list(string)` | n/a | yes |
| tags | Extra tags to attach to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| ca | Used for .ovpn templating |
| ca\_key | ca private key |
| endpoint\_arn | arn of the vpn endpoint |
| endpoint\_dns | Used for .ovpn templating |
| root\_cert | Used for .ovpn templating |
| root\_key | Used for .ovpn templating |

<!--- END_TF_DOCS --->

## Author

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License
Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-client-vpn/blob/master/LICENSE) for full details.
