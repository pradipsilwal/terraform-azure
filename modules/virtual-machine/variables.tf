variable "vm_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "os_disk_name" {
  type = string
}

variable "os_disk_caching" {
  type = string
}

variable "os_disk_storage_account_type" {
  type = string
}

variable "source_image_reference_publisher" {
  type = string
}

variable "source_image_reference_offer" {
  type = string
}

variable "source_image_reference_sku" {
  type = string
}

variable "source_image_reference_version" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "disable_password_authentication" {
  type = bool
}

variable "ssh_key" {
  type = string
}
