#cloud-config
package_update: true
package_upgrade: true

users:
  - name: ${username}
    groups: sudo
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    lock_passwd: false
    ssh_authorized_keys:
      - ${ssh_public_key}