terraform {
  backend "azurerm" {
    storage_account_name = "001terraformstatefiles"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  version = "=2.0.0"
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "meetup_online" {
  name     = "aosconf0810"
  location = "EAST US"
}

module "podcast_app_service" {

  source = "./modules/app_service"

  asp_name = "onlinemeetupfr001"

  app_name = "onlinemeetupfr001"

  resource_location = azurerm_resource_group.meetup_online.location

  resource_group_name = azurerm_resource_group.meetup_online.name

}

module "podcast_virtual_network" {

  source = "./modules/virtual_network"

  vnet_name = "myvnet001"

  resource_location = azurerm_resource_group.meetup_online.location

  resource_group_name = azurerm_resource_group.meetup_online.name

}


module "podcast_private_link" {

  source = "./modules/private_link"

  private_endpoint_name = "myprivateendpoint"

  resource_location = azurerm_resource_group.meetup_online.location

  resource_group_name = azurerm_resource_group.meetup_online.name

  subnet_id = module.podcast_virtual_network.app_service_id

  resource_id = module.podcast_app_service.app_service_id

}

module "podcast_virtual_machine" {

  source = "./modules/virtual_machine"

  virtual_machine_name = "myvm001"

  resource_location = azurerm_resource_group.meetup_online.location

  resource_group_name = azurerm_resource_group.meetup_online.name

  subnet_id = module.podcast_virtual_network.app_service_id
  
  network_interface_name = "mynicvm01"

  username = "charotam"

  password = "AmineAos1290"

}
