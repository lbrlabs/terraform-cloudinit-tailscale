<!-- BEGIN_TF_DOCS -->




## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accept_dns"></a> [accept\_dns](#input\_accept\_dns) | Accept DNS configuration from Tailscale | `bool` | `true` | no |
| <a name="input_accept_routes"></a> [accept\_routes](#input\_accept\_routes) | Accept routes from Tailscale | `bool` | `false` | no |
| <a name="input_advertise_connector"></a> [advertise\_connector](#input\_advertise\_connector) | Advertise this node as an app connector | `bool` | `false` | no |
| <a name="input_advertise_exit_node"></a> [advertise\_exit\_node](#input\_advertise\_exit\_node) | Offer to be an exit node for internet traffic for the tailnet | `bool` | `false` | no |
| <a name="input_advertise_routes"></a> [advertise\_routes](#input\_advertise\_routes) | Routes to advertise to other nodes | `list(string)` | `[]` | no |
| <a name="input_advertise_tags"></a> [advertise\_tags](#input\_advertise\_tags) | ACL tags to request; each must start with 'tag:' (e.g. 'tag:eng,tag:montreal,tag:ssh') | `list(string)` | `[]` | no |
| <a name="input_auth_key"></a> [auth\_key](#input\_auth\_key) | Node authorization key; if it begins with 'file:', then it's a path to a file containing the authkey | `string` | n/a | yes |
| <a name="input_base64_encode"></a> [base64\_encode](#input\_base64\_encode) | Whether to base64 encode the cloud-init data | `bool` | `true` | no |
| <a name="input_enable_ssh"></a> [enable\_ssh](#input\_enable\_ssh) | Enable SSH access via Tailscale | `bool` | `false` | no |
| <a name="input_exit_node"></a> [exit\_node](#input\_exit\_node) | Tailscale exit node (IP or base name) for internet traffic | `string` | `""` | no |
| <a name="input_exit_node_allow_lan_access"></a> [exit\_node\_allow\_lan\_access](#input\_exit\_node\_allow\_lan\_access) | Allow direct access to the local network when routing traffic via an exit node | `bool` | `false` | no |
| <a name="input_force_reauth"></a> [force\_reauth](#input\_force\_reauth) | force reauthentication | `bool` | `false` | no |
| <a name="input_gzip"></a> [gzip](#input\_gzip) | Whether to gzip the cloud-init data | `bool` | `false` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of the instance | `string` | `""` | no |
| <a name="input_json"></a> [json](#input\_json) | output in JSON format | `bool` | `false` | no |
| <a name="input_login_server"></a> [login\_server](#input\_login\_server) | base URL of control server | `string` | `"https://controlplane.tailscale.com"` | no |
| <a name="input_max_retries"></a> [max\_retries](#input\_max\_retries) | maximum number of retries to connect to the control server | `number` | `3` | no |
| <a name="input_netfilter_mode"></a> [netfilter\_mode](#input\_netfilter\_mode) | netfilter mode | `string` | `"on"` | no |
| <a name="input_operator"></a> [operator](#input\_operator) | Unix username to allow to operate on tailscaled without sudo | `string` | `""` | no |
| <a name="input_reset"></a> [reset](#input\_reset) | reset unspecified settings to their default values | `bool` | `false` | no |
| <a name="input_retry_delay"></a> [retry\_delay](#input\_retry\_delay) | delay in seconds between retries to connect to the control server | `number` | `5` | no |
| <a name="input_shields_up"></a> [shields\_up](#input\_shields\_up) | don't allow incoming connections | `bool` | `false` | no |
| <a name="input_snat_subnet_routes"></a> [snat\_subnet\_routes](#input\_snat\_subnet\_routes) | source NAT traffic to local routes advertised with --advertise-routes | `bool` | `true` | no |
| <a name="input_stateful_filtering"></a> [stateful\_filtering](#input\_stateful\_filtering) | apply stateful filtering to forwarded packets | `bool` | `false` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | maximum amount of time to wait for tailscaled to enter a Running state | `string` | `"0s"` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rendered"></a> [rendered](#output\_rendered) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | >= 2.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | >= 2.0 |

## Resources

| Name | Type |
|------|------|
| [cloudinit_config.main](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |
<!-- END_TF_DOCS -->
