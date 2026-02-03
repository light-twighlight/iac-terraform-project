variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  default = "prod-key"
}

variable "allowed_ssh_cidr" {
  default = ["YOUR_IP/32"]
}

variable "allowed_app_cidr" {
  default = ["YOUR_IP/32"]
}
