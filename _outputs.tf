output "endpoint_dns" {
  value       = aws_ec2_client_vpn_endpoint.default.dns_name
  description = "Used for .ovpn templating"
}

output "endpoint_arn" {
  value       = aws_ec2_client_vpn_endpoint.default.arn
  description = "arn of the vpn endpoint"
}

output "ca" {
  value       = tls_self_signed_cert.ca.cert_pem
  sensitive   = true
  description = "Used for .ovpn templating"
}

output "ca_key" {
  value       = "tls_private_key.ca.private_key_pem"
  sensitive   = true
  description = "ca private key"
}

output "root_cert" {
  value       = tls_locally_signed_cert.root.cert_pem
  sensitive   = true
  description = "Used for .ovpn templating"
}

output "root_key" {
  value       = tls_private_key.root.private_key_pem
  sensitive   = true
  description = "Used for .ovpn templating"
}
