module "ou" {
  source = "../"

  root_ou_id = "r-example"
  organization = {
    "infra" = {
      name = "Infrastructure",
      key  = "infra",
      units = {
        "network" = {
          name = "Network",
          key  = "network",
          units = {
            "network-prod" = {
              name = "Prod",
              key  = "network-prod"
            },
            "network-non-prod" = {
              name = "Non-Prod",
              key  = "network-non-prod"
            }
          }
        },
        "backup" = {
          name = "Backup",
          key  = "backup",
          units = {
            "backup-prod" = {
              name = "Prod",
              key  = "backup-prod"
            },
            "backup-non-prod" = {
              name = "Non-Prod",
              key  = "backup-non-prod"
            }
          }
        }
      }
    },
    "workloads" = {
      name = "Workloads",
      key  = "workloads",
      units = {
        "workload-prod" = {
          name = "Prod",
          key  = "workload-prod"
        },
        "workload-non-prod" = {
          name = "Non-Prod",
          key  = "workload-non-prod"
        }
      }
    },
    "shared-services" = {
      name = "Shared Services",
      key  = "shared-services",
      units = {
        "shared-services-prod" = {
          name = "Prod",
          key  = "shared-services-prod"
        },
        "shared-services-non-prod" = {
          name = "Non-Prod",
          key  = "shared-services-non-prod"
        }
      }
    },
    "identity" = {
      name = "Identity",
      key  = "identity"
    },
    "aft-mgmt" = {
      name = "AFT Management",
      key  = "aft-mgmt"
    },
    "suspended" = {
      name = "Suspended",
      key  = "suspended"
    }
  }
}
