resource "aws_organizations_organizational_unit" "level_1_ous" {
  for_each  = { for record in local.level_1_ou_arguments : record.key => record }
  name      = each.value.name
  parent_id = var.root_ou_id
}

resource "aws_organizations_organizational_unit" "level_2_ous" {
  for_each  = { for record in local.level_2_ou_arguments : record.key => record }
  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.level_1_ous[each.value.parent].id
}

resource "aws_organizations_organizational_unit" "level_3_ous" {
  for_each  = { for record in local.level_3_ou_arguments : record.key => record }
  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.level_2_ous[each.value.parent].id
}

resource "aws_organizations_organizational_unit" "level_4_ous" {
  for_each  = { for record in local.level_4_ou_arguments : record.key => record }
  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.level_3_ous[each.value.parent].id
}

resource "aws_organizations_organizational_unit" "level_5_ous" {
  for_each  = { for record in local.level_5_ou_arguments : record.key => record }
  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.level_4_ous[each.value.parent].id
}
