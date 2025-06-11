module "vpc" {
  source   = "./modules/vpc"
  env_name = "production"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" }
  ]
}

module "vm" {
  instance_names          = ["db-clickhouse","logs-vector","ui-lighthouse"]
  source                 = "./modules/vm"
  network_id             = module.vpc.subnet_info[0].network_id
  subnet_ids             = [module.vpc.subnet_info[0].id]
  subnet_zones           = [module.vpc.subnet_info[0].zone]
  image_family           = "ubuntu-2004-lts"
  public_ip              = true
  platform               = "standard-v3"
  instance_core_fraction = 20

  metadata = {
    user-data = templatefile("${path.module}/templates/cloud-init.tpl", {
      ssh_public_key = file("~/.ssh/yavm.pub")
      username       = var.ssh_username
    })
  }
}
