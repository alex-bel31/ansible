data "yandex_compute_image" "my_image" {
  family = var.image_family
}

resource "yandex_compute_instance" "vm" {
  for_each = toset(var.instance_names)

  name     = each.key #== null ? each.key : "${var.env_name}-${each.key}"
  hostname = each.key #== null ? each.key : "${var.env_name}-${each.key}"

  platform_id        = var.platform
  zone               = element(var.subnet_zones, index(var.instance_names, each.key))
  description        = "${var.description} {{terraform managed}}"

  scheduling_policy {
    preemptible = var.preemptible
  }

  resources {
    cores         = var.instance_cores
    memory        = var.instance_memory
    core_fraction = var.instance_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.image_id
      type     = var.boot_disk_type
      size     = var.boot_disk_size
    }
  }

  network_interface {
    subnet_id          = element(var.subnet_ids, index(var.instance_names, each.key))
    nat                = var.public_ip
  }

  metadata = {
    for k, v in var.metadata : k => v
  }
}