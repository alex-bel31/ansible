resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/hosts.tftpl", {
    vm = module.vm,
    ssh_username = var.ssh_username
    private_key_path = var.ssh_key_path
  })

  filename = abspath("${path.module}/../playbook/inventory/hosts.yaml")
}