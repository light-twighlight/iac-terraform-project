variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed to SSH"
  type        = list(string)
}

variable "allowed_app_cidr" {
  description = "CIDR blocks allowed to access app"
  type        = list(string)
}

variable "app_port" {
  description = "Application port"
  type        = number
  default     = 8000
}

variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}
