data "azurerm_key_vault" "main" {
  count               = (var.keyvault.enable == true && var.keyvault.name != "" && var.keyvault.resource_group_name != "" ? 1 : 0)
  name                = var.keyvault.name
  resource_group_name = var.keyvault.resource_group_name
}

data "azuread_user" "main" {
  count               = (var.user_principal_name != "" ? 1 : 0)
  user_principal_name = var.user_principal_name
}
