variable "do_token" {
  sensitive = true
  type      = string
}

variable "tailscale_auth_key" {
  description = "Tailscale auth key for the client"
  type        = string
  sensitive   = true
}

variable "ssh_key_ids" {
  description = "List of SSH key IDs to add to the droplet"
  type        = list(string)
  default     = []
}
