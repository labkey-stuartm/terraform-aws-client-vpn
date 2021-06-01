variable "name" {
  description = "Name prefix for the resources of this stack"
}

variable "cidr" {
  description = "Network CIDR to use for clients"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ID to associate clients"
}

variable "organization_name" {
  description = "Name of organization to use in private certificate"
  default     = "ACME, Inc"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to attach to resources"
}

variable "logs_retention" {
  type        = number
  default     = 365
  description = "Retention in days for CloudWatch Log Group"
}

variable "split_tunnel" {
  type        = bool
  default     = false
  description = "Indicates whether split-tunnel is enabled on VPN endpoint"
}

variable "dns_servers" {
  type        = list(string)
  default     = ["", ""]
  description = "list of dns servers to use"
}

variable "vpn_client_sgs" {
  type        = list(string)
  default     = [""]
  description = "security group to associate with client vpn - allows or denys traffic"
}
