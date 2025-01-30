output "vyos_public_ip" {
  value = aws_instance.vyos.public_ip
}

output "vyos_pub_nic_ip" {
  value = aws_network_interface.vyos_public_nic.private_ip
}

output "vyos_priv_nic_01_ip" {
  value = aws_network_interface.vyos_private_nic_01.private_ip
}
output "web_private_nic_01_ip" {
  value = aws_network_interface.web_private_nic_01.private_ip
}
output "vyos_key_name" {
  value = aws_instance.vyos.key_name
}
