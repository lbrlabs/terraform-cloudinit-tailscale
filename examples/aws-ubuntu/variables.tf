variable "tailscale_auth_key" {
  description = "Node authorization key; if it begins with 'file:', then it's a path to a file containing the authkey"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}
