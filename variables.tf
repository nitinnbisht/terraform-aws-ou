variable "root_ou_id" {
  type        = string
  description = "The ID of the root OU"
}

variable "organization" {
  description = "A nested map of Organizational Units (OUs) to be created. Supports multiple levels of nested OUs."
  type = map(object({
    name = string,
    key  = string,
    units = optional(map(object({
      name = string,
      key  = string,
      units = optional(map(object({
        name = string,
        key  = string,
        units = optional(map(object({
          name = string,
          key  = string,
          units = optional(map(object({
            name = string,
            key  = string
          })), {})
        })), {})
      })), {})
    })), {})
  }))
  default = {}
}
