locals {
  # Process level 1 OUs (top-level)
  level_1_ou_arguments = [
    for ou_key, ou in var.organization : {
      name = ou.name,
      key  = ou.key
    }
  ]

  # Process level 2 OUs (children of level 1)
  level_2_ou_arguments = flatten([
    for level_1_key, level_1_ou in var.organization :
    [
      for level_2_key, level_2_ou in lookup(level_1_ou, "units", {}) :
      {
        name   = level_2_ou.name,
        key    = level_2_ou.key,
        parent = level_1_ou.key
      }
    ]
  ])

  # Process level 3 OUs (children of level 2)
  level_3_ou_arguments = flatten([
    for level_1_key, level_1_ou in var.organization :
    [
      for level_2_key, level_2_ou in lookup(level_1_ou, "units", {}) :
      [
        for level_3_key, level_3_ou in lookup(level_2_ou, "units", {}) :
        {
          name   = level_3_ou.name,
          key    = level_3_ou.key,
          parent = level_2_ou.key
        }
      ]
    ]
  ])

  # Process level 4 OUs (children of level 3)
  level_4_ou_arguments = flatten([
    for level_1_key, level_1_ou in var.organization :
    [
      for level_2_key, level_2_ou in lookup(level_1_ou, "units", {}) :
      [
        for level_3_key, level_3_ou in lookup(level_2_ou, "units", {}) :
        [
          for level_4_key, level_4_ou in lookup(level_3_ou, "units", {}) :
          {
            name   = level_4_ou.name,
            key    = level_4_ou.key,
            parent = level_3_ou.key
          }
        ]
      ]
    ]
  ])

  # Process level 5 OUs (children of level 4)
  level_5_ou_arguments = flatten([
    for level_1_key, level_1_ou in var.organization :
    [
      for level_2_key, level_2_ou in lookup(level_1_ou, "units", {}) :
      [
        for level_3_key, level_3_ou in lookup(level_2_ou, "units", {}) :
        [
          for level_4_key, level_4_ou in lookup(level_3_ou, "units", {}) :
          [
            for level_5_key, level_5_ou in lookup(level_4_ou, "units", {}) :
            {
              name   = level_5_ou.name,
              key    = level_5_ou.key,
              parent = level_4_ou.key
            }
          ]
        ]
      ]
    ]
  ])
}
