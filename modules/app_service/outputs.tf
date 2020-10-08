output "app_service_id" {
  value       = azurerm_app_service.app_service.id
  description = "The ID of the web app."
}

output "app_service_plan_id" {
  value       = azurerm_app_service_plan.app_service_plan.id
  description = "The ID of the app service plan."
}
