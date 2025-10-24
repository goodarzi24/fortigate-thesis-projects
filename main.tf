terraform {
  required_version = ">= 1.0"
}

provider "fortiadc" {
  hostname = "192.168.1.99"
  username = "admin"
  password = "test123"
  insecure = true
}

resource "fortiadc_load_balance_real_server" "test_server" {
  name    = "test-server-01"
  address = "192.168.1.100"
  type    = "ip"
  status  = "enable"
}
