# azure_service_principal_terraform_module

Módulo de Terraform para criar service principal na Azure e com possibilidade de enviar as credenciais desse service principal para o Key Vault da Azure.

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azuread"></a> [azuread](#provider_azuread) | n/a     |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                     | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azuread_application.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application)                                  | resource    |
| [azuread_application_password.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password)                | resource    |
| [azuread_service_principal.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal)                      | resource    |
| [azurerm_key_vault_secret.main-client-id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)              | resource    |
| [azurerm_key_vault_secret.main-client-secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret)          | resource    |
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)                          | resource    |
| [azurerm_role_assignment.main-keyvault-secrets-officer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource    |
| [azuread_user.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user)                                             | data source |
| [azurerm_key_vault.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault)                                   | data source |

## Inputs

| Name                                                                                                                           | Description                                                                                                        | Type                                                                                                                                                    | Default                                                                                                                   | Required |
| ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_keyvault"></a> [keyvault](#input_keyvault)                                                                      | Variável para habilitar operações no Key Vault da Azure. Consulte a documentação para mais informações.            | <pre>object({<br> enable = bool<br> name = string<br> resource_group_name = string<br> role = optional(string)<br> export = optional(bool)<br> })</pre> | <pre>{<br> "enable": false,<br> "export": false,<br> "name": "",<br> "resource_group_name": "",<br> "role": ""<br>}</pre> |    no    |
| <a name="input_service_principal_name"></a> [service_principal_name](#input_service_principal_name)                            | Nome (Display Name) do service principal                                                                           | `string`                                                                                                                                                | n/a                                                                                                                       |   yes    |
| <a name="input_service_principal_role"></a> [service_principal_role](#input_service_principal_role)                            | Permissão (role) que o service principal irá ter                                                                   | `string`                                                                                                                                                | n/a                                                                                                                       |   yes    |
| <a name="input_service_principal_role_scope_id"></a> [service_principal_role_scope_id](#input_service_principal_role_scope_id) | Id do recurso que o service principal terá permissão (exemplo: /subscription/00000000-0000-0000-0000-000000000000) | `string`                                                                                                                                                | n/a                                                                                                                       |   yes    |
| <a name="input_user_principal_name"></a> [user_principal_name](#input_user_principal_name)                                     | Nome do usuário que será o proprietário do service principal                                                       | `string`                                                                                                                                                | `""`                                                                                                                      |    no    |

## Outputs

| Name                                                                                               | Description |
| -------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_main_sp_client_id"></a> [main_sp_client_id](#output_main_sp_client_id)             | n/a         |
| <a name="output_main_sp_client_secret"></a> [main_sp_client_secret](#output_main_sp_client_secret) | n/a         |
| <a name="output_main_sp_name"></a> [main_sp_name](#output_main_sp_name)                            | n/a         |
| <a name="output_main_sp_object_id"></a> [main_sp_object_id](#output_main_sp_object_id)             | n/a         |

<!-- END_TF_DOCS -->
