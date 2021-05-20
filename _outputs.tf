output "endpoint" {
  value       = aws_ec2_client_vpn_endpoint.default.dns_name
  description = "Used for .ovpn templating"
}

output "ca" {
  value       = tls_self_signed_cert.ca.cert_pem
  sensitive   = true
  description = "Used for .ovpn templating"
}

output "cert" {
  value       = tls_locally_signed_cert.root.cert_pem
  sensitive   = true
  description = "Used for .ovpn templating"
}

output "key" {
  value       = tls_private_key.root.private_key_pem
  sensitive   = true
  description = "Used for .ovpn templating"
}
