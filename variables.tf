variable "fortiadc_hostname" {
  description = "FortiADC management IP or hostname"
  type        = string
  default     = "192.168.1.99"
}

variable "fortiadc_username" {
  description = "FortiADC admin username"
  type        = string
  default     = "admin"
}

variable "fortiadc_password" {
  description = "FortiADC admin password"
  type        = string
  sensitive   = true
  default     = "password"
}
