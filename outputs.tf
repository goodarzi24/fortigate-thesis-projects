output "virtual_server_ip" {
  description = "Virtual Server IP Address"
  value       = fortiadc_load_balance_virtual_server.web_virtual_server.address
}

output "virtual_server_port" {
  description = "Virtual Server Port"
  value       = fortiadc_load_balance_virtual_server.web_virtual_server.port
}

output "real_servers" {
  description = "List of real servers"
  value       = [fortiadc_load_balance_real_server.web_server.address]
}
