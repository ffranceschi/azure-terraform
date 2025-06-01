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
  features {
    
  }
  # Para registrar client_id, client_secret e tenant_id, precisa entrar no entra id e registrar em app registrantion.
  # Depois ao entrar no registro, entrar na opcao certificates & secrets para criar o client_secret

}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "East US"
}


resource "azurerm_storage_account" "appstore11984826150" {
  name                     = "appstore11984826150"
  resource_group_name      = azurerm_resource_group.appgrp.name
  location                 = azurerm_resource_group.appgrp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "develop"
  }
}

resource "azurerm_storage_container" "scripts" {
  name                  = "scripts"
  storage_account_id    = azurerm_storage_account.appstore11984826150.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "script01" {
  name                   = "script01.sh"
  storage_account_name   = azurerm_storage_account.appstore11984826150.name
  storage_container_name = azurerm_storage_container.scripts.name
  type                   = "Block"
  source                 = "script01.sh"
}