data "cloudinit_config" "main" {
  gzip          = var.gzip
  base64_encode = var.base64_encode

  part {
    filename     = "ip_forwarding.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/files/ip_forwarding.sh")
  }

  part {
    filename     = "install_tailscale.sh"
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/install_tailscale.sh.tmpl", {
      TRACK       = var.track
      MAX_RETRIES = var.max_retries
      RETRY_DELAY = var.retry_delay
    })
  }

  part {
    filename     = "setup_tailscale.sh"
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/setup_tailscale.sh.tmpl", {
      ADVERTISE_ROUTES           = join(",", var.advertise_routes)
      ADVERTISE_TAGS             = join(",", var.advertise_tags)
      ACCEPT_DNS                 = var.accept_dns
      ACCEPT_ROUTES              = var.accept_routes
      ADVERTISE_CONNECTOR        = var.advertise_connector
      ADVERTISE_EXIT_NODE        = var.advertise_exit_node
      HOSTNAME                   = var.hostname
      TAILSCALE_SSH              = var.enable_ssh
      AUTH_KEY                   = sensitive(var.auth_key)
      EXIT_NODE                  = var.exit_node
      EXIT_NODE_ALLOW_LAN_ACCESS = var.exit_node_allow_lan_access
      FORCE_REAUTH               = var.force_reauth
      JSON                       = var.json
      LOGIN_SERVER               = var.login_server
      OPERATOR                   = var.operator
      RESET                      = var.reset
      SHIELDS_UP                 = var.shields_up
      TIMEOUT                    = var.timeout
      SNAT_SUBNET_ROUTES         = var.snat_subnet_routes
      NETFILTER_MODE             = var.netfilter_mode
      STATEFUL_FILTERING         = var.stateful_filtering
      MAX_RETRIES                = var.max_retries
      RETRY_DELAY                = var.retry_delay
    })
  }

  dynamic "part" {
    for_each = var.additional_parts
    content {
      filename     = part.value.filename
      content_type = part.value.content_type
      content      = part.value.content
    }
  }
}
