terraform {
  required_version = ">= 1.0"
  
  required_providers {
    fortiadc = {
      source = "fortinetdev/fortiadc"
      version = "~> 1.0"
    }
  }
}

# Configure the FortiADC Provider
provider "fortiadc" {
  hostname = var.fortiadc_hostname
  username = var.fortiadc_username
  password = var.fortiadc_password
  insecure = true
}

# Create Virtual Domain (VDOM)
resource "fortiadc_system_vdom" "thesis_vdom" {
  name = "thesis-vdom"
  comment = "VDOM for Thesis Project"
}

# Create Real Server
resource "fortiadc_load_balance_real_server" "web_server" {
  name = "web-server-1"
  address = "192.168.1.10"
  type = "ip"
  status = "enable"
  depends_on = [fortiadc_system_vdom.thesis_vdom]
}

# Create Real Server Pool
resource "fortiadc_load_balance_pool" "web_pool" {
  name = "web-pool"
  type = "static"
  pool_type = "ipv4"
  depends_on = [fortiadc_system_vdom.thesis_vdom]
}

# Create Pool Member
resource "fortiadc_load_balance_pool_member" "web_member" {
  pkey = fortiadc_load_balance_pool.web_pool.name
  real_server = fortiadc_load_balance_real_server.web_server.name
  port = 80
  status = "enable"
}

# Create Virtual Server
resource "fortiadc_load_balance_virtual_server" "web_virtual_server" {
  name = "web-vs"
  type = "l7-load-balance"
  address = "10.0.0.100"
  port = 80
  interface = "port1"
  pool = fortiadc_load_balance_pool.web_pool.name
  profile = "LB_PROF_HTTP"
  method = "LB_METHOD_ROUND_ROBIN"
  status = "enable"
  depends_on = [fortiadc_system_vdom.thesis_vdom]
}
