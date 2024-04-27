terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}
# variable "client_secret" {
# }

provider "azurerm" {
  features {}
  # client_id       = data.azurerm_client_config.current.client_id
  # #client_secret   = var.client_secret
  # tenant_id       = data.azurerm_client_config.current.tenant_id
  # subscription_id = data.azurerm_client_config.current.subscription_id
}

  # client_id       = "a5902ea0-1e2b-4845-9ed4-703ccbf245f8"
  # client_secret   = var.client_secret
  # tenant_id       = "4d0b0d71-57da-49bf-a6bf-dc7a98993e3d"
  # subscription_id = "4fb69f8f-afe2-4799-8629-fd2ac4cbfbd6"