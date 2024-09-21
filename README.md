# terraform-aws-ou
This Terraform module helps to create nested Organizational Units (OUs) within an AWS Organization in a scalable and efficient manner. It supports multi-level OU creation and allows for flexible organization hierarchies.

## Features
- Create nested AWS Organizational Units (OUs) across multiple levels.
- Easily scalable for large organizations with complex hierarchies.
- Allows for defining multiple child OUs under each parent OU.
- Compatible with AWS Control Tower and AWS Organizations.

## Usage

### Basic Example

```hcl
module "ou" {
  source = "git::https://github.com/nitinnbisht/terraform-aws-ou.git"
  version = "0.0.1"

  root_ou_id = "r-example"

  organization = {
    # Level 1 OU: Infrastructure
    "infra" = {
      name = "Infrastructure"
      key  = "infra"

      units = {
        # Level 2 OU: Network (Child of Infrastructure)
        "network" = {
          name = "Network"
          key  = "network"

          units = {
            # Level 3 OUs: Prod and Non-Prod (Children of Network)
            "network-prod" = {
              name = "Prod"
              key  = "network-prod"
            }

            "network-non-prod" = {
              name = "Non-Prod"
              key  = "network-non-prod"
            }
          }
        }
      }
    }
  }
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.65.0 |

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organizational_unit.level_1_ous](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.level_2_ous](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.level_3_ous](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.level_4_ous](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organizational_unit.level_5_ous](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_organization"></a> [organization](#input\_organization) | A nested map of Organizational Units (OUs) to be created. Supports multiple levels of nested OUs. | <pre>map(object({<br>    name = string,<br>    key  = string,<br>    units = optional(map(object({<br>      name = string,<br>      key  = string,<br>      units = optional(map(object({<br>        name = string,<br>        key  = string,<br>        units = optional(map(object({<br>          name = string,<br>          key  = string,<br>          units = optional(map(object({<br>            name = string,<br>            key  = string<br>          })), {})<br>        })), {})<br>      })), {})<br>    })), {})<br>  }))</pre> | `{}` | no |
| <a name="input_root_ou_id"></a> [root\_ou\_id](#input\_root\_ou\_id) | The ID of the root OU | `string` | n/a | yes |
<!-- END_TF_DOCS -->

## Acknowledgments
Special thanks to Infrablocks for providing the inspiration for this module. You can find their original work [here](https://github.com/infrablocks/terraform-aws-organization).
