output "vm_id" {
  value = azurerm_linux_virtual_machine.linuxvm.id
  sensitive = true
}

output "vm_ip" {
  value = azurerm_linux_virtual_machine.linuxvm.public_ip_address
  sensitive = true
}

output "tls_private_key" { 
  value = tls_private_key.example_ssh.private_key_pem 
  sensitive = true
}