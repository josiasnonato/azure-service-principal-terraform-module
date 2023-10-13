variable "service_principal_name" {
  type        = string
  description = "Nome (Display Name) do service principal"
}

variable "user_principal_name" {
  type        = string
  default     = ""
  description = "Nome do usuário que será o proprietário do service principal"
}

variable "service_principal_role" {
  type        = string
  description = "Permissão (role) que o service principal irá ter"
}

variable "service_principal_role_scope_id" {
  type        = string
  description = "Id do recurso que o service principal terá permissão (exemplo: /subscription/00000000-0000-0000-0000-000000000000)"
}

variable "keyvault" {
  type = object({
    enable              = bool
    name                = string
    resource_group_name = string
    role                = optional(string)
    export              = optional(bool)
  })
  default = {
    enable              = false
    name                = ""
    resource_group_name = ""
    role                = ""
    export              = false
  }
  description = "Variável para habilitar operações no Key Vault da Azure. Consulte a documentação para mais informações."
}
