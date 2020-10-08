resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.private_endpoint_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.private_endpoint_name
    private_connection_resource_id = var.resource_id
    is_manual_connection           = false
    subresource_names = ["sites"]
  }
}