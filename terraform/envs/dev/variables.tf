variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "dev-key"
}

variable "allowed_ssh_cidr" {
  default = ["0.0.0.0/0"]
}

variable "allowed_app_cidr" {
  default = ["0.0.0.0/0"]
}
