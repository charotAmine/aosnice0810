
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.asp_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name

  sku {
    tier = "PremiumV2"
    size = "P1v2"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

}