variable "base64_encode" {
  description = "Whether to base64 encode the cloud-init data"
  type        = bool
  default     = true
}

variable "gzip" {
  description = "Whether to gzip the cloud-init data"
  type        = bool
  default     = false
}

variable "enable_ssh" {
  description = "Enable SSH access via Tailscale"
  type        = bool
  default     = false
}

variable "hostname" {
  description = "Hostname of the instance"
  type        = string
  default     = ""
}

variable "accept_dns" {
  description = "Accept DNS configuration from Tailscale"
  type        = bool
  default     = true
}

variable "accept_routes" {
  description = "Accept routes from Tailscale"
  type        = bool
  default     = false
}

variable "advertise_connector" {
  description = "Advertise this node as an app connector"
  type        = bool
  default     = false
}

variable "advertise_exit_node" {
  description = "Offer to be an exit node for internet traffic for the tailnet"
  type        = bool
  default     = false
}

variable "advertise_routes" {
  description = "Routes to advertise to other nodes"
  type        = list(string)
  default     = []
}

variable "advertise_tags" {
  description = "ACL tags to request; each must start with 'tag:' (e.g. 'tag:eng,tag:montreal,tag:ssh')"
  type        = list(string)
  default     = []
  validation {
    condition     = length(var.advertise_tags) == 0 || alltrue([for tag in var.advertise_tags : startswith(tag, "tag:")])
    error_message = "Each item in advertise_tags must start with 'tag:'."
  }
}

variable "auth_key" {
  description = "Node authorization key; if it begins with 'file:', then it's a path to a file containing the authkey"
  type        = string
}

variable "exit_node" {
  description = "Tailscale exit node (IP or base name) for internet traffic"
  type        = string
  default     = ""
}

variable "exit_node_allow_lan_access" {
  description = "Allow direct access to the local network when routing traffic via an exit node"
  type        = bool
  default     = false
}

variable "force_reauth" {
  description = "force reauthentication"
  type        = bool
  default     = false
}

variable "json" {
  description = "output in JSON format"
  type        = bool
  default     = false
}

variable "login_server" {
  description = "base URL of control server"
  type        = string
  default     = "https://controlplane.tailscale.com"
}

variable "operator" {
  description = "Unix username to allow to operate on tailscaled without sudo"
  type        = string
  default     = ""
}

variable "reset" {
  description = "reset unspecified settings to their default values"
  type        = bool
  default     = false
}

variable "shields_up" {
  description = "don't allow incoming connections"
  type        = bool
  default     = false
}

variable "timeout" {
  description = "maximum amount of time to wait for tailscaled to enter a Running state"
  type        = string
  default     = "0s"
}

variable "netfilter_mode" {
  description = "netfilter mode"
  type        = string
  default     = "on"

  validation {
    condition     = contains(["on", "nodivert", "off"], var.netfilter_mode)
    error_message = "Allowed values for netfilter_mode are \"on\", \"nodivert\", or \"off\"."
  }
}

variable "snat_subnet_routes" {
  description = "source NAT traffic to local routes advertised with --advertise-routes"
  type        = bool
  default     = true
}

variable "stateful_filtering" {
  description = "apply stateful filtering to forwarded packets"
  type        = bool
  default     = false
}

variable "max_retries" {
    description = "maximum number of retries to connect to the control server"
    type        = number
    default     = 3
}

variable "retry_delay" {
    description = "delay in seconds between retries to connect to the control server"
    type        = number
    default     = 5
}
