output "external_ip_address" {
  value = {
    for name, inst in yandex_compute_instance.vm :
    name => inst.network_interface[0].nat_ip_address
  }
}

output "internal_ip_address" {
  value = {
    for name, inst in yandex_compute_instance.vm :
    name => inst.network_interface[0].ip_address
  }
}

output "fqdn" {
  value = {
    for name, inst in yandex_compute_instance.vm :
    name => inst.fqdn
  }
}

output "network_interface" {
  value = {
    for name, inst in yandex_compute_instance.vm :
    name => inst.network_interface
  }
}
