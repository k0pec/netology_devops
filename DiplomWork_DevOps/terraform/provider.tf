# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "infra-state"
    region     = "ru-central1"
    key        = "remote-state.tfstate"
    access_key = "YCAJETqDztHh4A-5vYXZsebu4"
    secret_key = "<you_secret_key>"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  #token     = "${var.yandex_cloud_token}"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone      = "ru-central1-a"
}
