resource "azurerm_virtual_network" "mymeetupvnet" {
  name                = var.vnet_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "endpoint" {
  name                 = "endpoint"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.mymeetupvnet.name
  address_prefix       = "10.0.0.0/24"

  enforce_private_link_endpoint_network_policies = true
}
