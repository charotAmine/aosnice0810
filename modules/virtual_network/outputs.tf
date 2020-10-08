output "app_service_id" {
  value       = azurerm_subnet.endpoint.id
  description = "The ID of the subnet."
}