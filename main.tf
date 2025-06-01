terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "East US"
}