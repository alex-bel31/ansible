variable "cloud_id" {
  description = "Cloud ID"
  type        = string
  sensitive   = true
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
  sensitive   = true
}

variable "default_zone" {
  description = "Default zone"
  type        = string
  sensitive   = true
}

variable "ssh_username" {
  description = "SSH username"
  type        = string
  sensitive   = true
}

variable "ssh_key_path" {
  description = "Path to private SSH key"
  type = string
  sensitive = true
}