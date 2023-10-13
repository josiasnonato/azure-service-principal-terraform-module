resource "azuread_application" "main" {
  display_name = var.service_principal_name
  owners       = (var.user_principal_name != "" ? [data.azuread_user.main[0].object_id] : null)
}

resource "azuread_service_principal" "main" {
  application_id               = azuread_application.main.application_id
  app_role_assignment_required = false
}

resource "azuread_application_password" "main" {
  application_object_id = azuread_application.main.object_id
}

resource "azurerm_role_assignment" "main" {
  scope                = var.service_principal_role_scope_id
  role_definition_name = var.service_principal_role
  principal_id         = azuread_service_principal.main.object_id
}

resource "azurerm_role_assignment" "main-keyvault-secrets-officer" {
  count = (var.keyvault.enable == true ? 1 : 0)

  scope                = data.azurerm_key_vault.main[0].id
  role_definition_name = (var.keyvault.role == null || var.keyvault.role == "" ? "Key Vault Secrets Officer" : var.keyvault.role)
  principal_id         = azuread_service_principal.main.object_id
}

resource "azurerm_key_vault_secret" "main-client-id" {
  count = (var.keyvault.enable == true && var.keyvault.export == true ? 1 : 0)

  name         = "${upper(var.service_principal_name)}-CLIENT-ID"
  value        = azuread_service_principal.main.application_id
  key_vault_id = data.azurerm_key_vault.main[0].id

  depends_on = [azurerm_role_assignment.main-keyvault-secrets-officer]
}


resource "azurerm_key_vault_secret" "main-client-secret" {
  count = (var.keyvault.enable == true && var.keyvault.export == true ? 1 : 0)

  name         = "${upper(var.service_principal_name)}-CLIENT-SECRET"
  value        = azuread_application_password.main.value
  key_vault_id = data.azurerm_key_vault.main[0].id

  depends_on = [azurerm_role_assignment.main-keyvault-secrets-officer]
}

output "main_sp_name" {
  value = azuread_service_principal.main.display_name
}

output "main_sp_object_id" {
  value = azuread_service_principal.main.object_id
}

output "main_sp_client_id" {
  value = azuread_service_principal.main.application_id
}

output "main_sp_client_secret" {
  value     = azuread_application_password.main.value
  sensitive = true
}
