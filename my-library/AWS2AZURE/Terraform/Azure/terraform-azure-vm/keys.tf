# Create (and display) an SSH key
resource "tls_private_key" "ubuntu_dev_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}
output "tls_private_key_ubuntu" { 
    value = tls_private_key.ubuntu_dev_key.private_key_pem 
    sensitive = true
}


resource "tls_private_key" "redhat_dev_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}
output "tls_private_key_redhat" { 
    value = tls_private_key.redhat_dev_key.private_key_pem 
    sensitive = true
}