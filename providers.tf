terraform {
  required_version = ">= 1.0"
  
  required_providers {
    fortiadc = {
      source = "fortinetdev/fortiadc"
      version = "~> 1.0"
    }
  }
}
