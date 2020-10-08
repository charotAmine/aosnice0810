variable "asp_name" {
  type        = string
  description = "The name of the app service plan that should be created."
}

variable "app_name" {
  type        = string
  description = "The name of the web app that should be created."
}

variable "resource_location" {
  type        = string
  description = "The location of the RG"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the RG"
}