resource "aws_ec2_client_vpn_endpoint" "default" {
  description            = var.name
  server_certificate_arn = aws_acm_certificate.server.arn
  client_cidr_block      = var.cidr
  split_tunnel           = var.split_tunnel
  dns_servers            = var.dns_servers

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = aws_acm_certificate.root.arn
  }

  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn.name
  }

  tags = var.tags
}

# use only first subnet to reduce monthly cost of vpn
resource "aws_ec2_client_vpn_network_association" "default" {
  #count                  = length(var.subnet_ids)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.default.id
  subnet_id              = element(var.subnet_ids, 0)
}

resource "aws_ec2_client_vpn_authorization_rule" "default" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.default.id
  target_network_cidr    = "0.0.0.0/0"
  authorize_all_groups   = true
  description            = var.name
}

# Add route to allow outbound access
resource "aws_ec2_client_vpn_route" "default" {
  #count                  = length(var.subnet_ids)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.default.id
  destination_cidr_block = "0.0.0.0/0"
  target_vpc_subnet_id   = element(var.subnet_ids, 0)
  depends_on             = [aws_ec2_client_vpn_network_association.default]
}
