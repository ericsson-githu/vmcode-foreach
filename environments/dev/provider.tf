terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "uday_aavayav"
    storage_account_name = "udaysingh965478"
    container_name       = "tfstate"
    key                  = "dev.terraform2.tfstate"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "2a6429ab-34bc-4c09-812c-9e5d8ceee0d7"
}
