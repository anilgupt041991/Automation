#--------------------------------------------------------------------
# Enable approle auth method 
#--------------------------------------------------------------------

#Intergration NS
resource "vault_auth_backend" "integration" {
  depends_on = [vault_namespace.integration]
  namespace  = vault_namespace.integration.path_fq
  type       = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "integration_platform_common" {
  #depends_on = [vault_namespace.integration.platform]
  namespace = vault_namespace.platform-common-integration.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "integration_platform_tentant" {
  #depends_on = [vault_policy.Int_Subsystem_Role]
  namespace = vault_namespace.platform-tenant-integration.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "integration_tentant" {
  #depends_on = [vault_policy.Int_Subsystem_Role]
  namespace = vault_namespace.tenant-integration.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}


#Developement NS
resource "vault_auth_backend" "development" {
  depends_on = [vault_namespace.development]
  namespace  = vault_namespace.development.path_fq
  type       = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "development_platform_common" {
  #depends_on = [vault_policy.Dev_Subsystem_Role]
  namespace = vault_namespace.platform-common-development.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "development_platform_tentant" {
  #depends_on = [vault_policy.Dev_Subsystem_Role]
  namespace = vault_namespace.platform-tenant-development.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "development_tentant" {
  #depends_on = [vault_policy.Dev_Subsystem_Role]
  namespace = vault_namespace.tenant-development.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

#Scale NS 
resource "vault_auth_backend" "scale" {
  depends_on = [vault_namespace.scale]
  namespace  = vault_namespace.scale.path_fq
  type       = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "scale_platform_common" {
  #depends_on = [vault_policy.Scale_Subsystem_Role]
  #depends_on = [vault_namespace.scale.platform]
  namespace = vault_namespace.platform-common-scale.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "scale_platform_tentant" {
  #depends_on = [vault_policy.Scale_Subsystem_Role]
  namespace = vault_namespace.platform-tenant-scale.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "scale_tentant" {
  #depends_on = [vault_policy.Scale_Subsystem_Role]
  namespace = vault_namespace.tenant-scale.path_fq
  type      = "approle"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

# Create a role named for each Env for  "Subsystem_Role,Subsystem_customer_Role and OnBoarding_Role"

#Roles for Integration ENV
resource "vault_approle_auth_backend_role" "int_subsystem_role" {
  backend   = vault_auth_backend.integration.path
  namespace = vault_namespace.integration.path_fq
  role_name = "int-subsystem-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["int-subsystem-policy"]
}

resource "vault_approle_auth_backend_role" "int_subsystem_customer-role" {
  backend   = vault_auth_backend.integration.path
  namespace = vault_namespace.integration.path_fq
  role_name = "int-subsystem-customer-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["int-subsystem-customer-policy"]
}

resource "vault_approle_auth_backend_role" "int_onboarding_role" {
  backend   = vault_auth_backend.integration.path
  namespace = vault_namespace.integration.path_fq
  role_name = "int-onboarding-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["int-onboarding-policy"]
}


#Roles for Dev ENV
resource "vault_approle_auth_backend_role" "dev_subsystem_role" {
  backend   = vault_auth_backend.development.path
  namespace = vault_namespace.development.path_fq
  role_name = "dev-subsystem-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["dev-subsystem-policy"]
}

resource "vault_approle_auth_backend_role" "dev_subsystem_customer_role" {
  backend   = vault_auth_backend.development.path
  namespace = vault_namespace.development.path_fq
  role_name = "dev-subsystem-customer-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["dev-subsystem-customer-policy"]
}

resource "vault_approle_auth_backend_role" "dev_onboarding_role" {
  backend   = vault_auth_backend.development.path
  namespace = vault_namespace.development.path_fq
  role_name = "dev-onboarding-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["dev-onboarding-policy"]
}

# #Roles for Scale ENV
resource "vault_approle_auth_backend_role" "scale_subsystem_role" {
  backend   = vault_auth_backend.scale.path
  namespace = vault_namespace.scale.path_fq
  role_name = "scale-subsystem-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["scale-subsystem-policy"]
}

resource "vault_approle_auth_backend_role" "scale_subsystem_customer_role" {
  backend   = vault_auth_backend.scale.path
  namespace = vault_namespace.scale.path_fq
  role_name = "scale-subsystem-customer-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["scale-subsystem-customer-policy"]
}

resource "vault_approle_auth_backend_role" "scale_onboarding_role" {
  backend   = vault_auth_backend.scale.path
  namespace = vault_namespace.scale.path_fq
  role_name = "scale-onboarding-role"
  #secret_id_bound_cidrs = ""
  #token_bound_cidrs     = ""
  token_ttl      = 28800
  secret_id_ttl  = 15780000
  token_policies = ["scale-onboarding-policy"]
}




#--------------------------------------------------------------------
# Enable K8s auth method 
#--------------------------------------------------------------------

#Intergration NS
resource "vault_auth_backend" "k8s_integration" {
  depends_on = [vault_namespace.integration]
  namespace  = vault_namespace.integration.path_fq
  type       = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}


resource "vault_auth_backend" "k8s_integration_platform_common" {
  #depends_on = [vault_namespace.integration.platform]
  namespace = vault_namespace.platform-common-integration.path_fq
  type      = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "k8s_integration_platform_tentant" {
  #depends_on = [vault_policy.Int_Subsystem_Role]
  namespace = vault_namespace.platform-tenant-integration.path_fq
  type      = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}



#Developement NS
resource "vault_auth_backend" "k8s_development" {
  depends_on = [vault_namespace.development]
  namespace  = vault_namespace.development.path_fq
  type       = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "k8s_development_platform_common" {
  #depends_on = [vault_policy.Dev_Subsystem_Role]
  namespace = vault_namespace.platform-common-development.path_fq
  type      = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "k8s_development_platform_tentant" {
  #depends_on = [vault_policy.Dev_Subsystem_Role]
  namespace = vault_namespace.platform-tenant-development.path_fq
  type      = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}


#Scale NS 
resource "vault_auth_backend" "k8s_scale" {
  depends_on = [vault_namespace.scale]
  namespace  = vault_namespace.scale.path_fq
  type       = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "k8s_scale_platform_common" {
  #depends_on = [vault_namespace.scale.platform]
  namespace = vault_namespace.platform-common-scale.path_fq
  type      = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}

resource "vault_auth_backend" "k8s_scale_platform_tentant" {
  #depends_on = [vault_policy.Scale_Subsystem_Role]
  namespace = vault_namespace.platform-tenant-scale.path_fq
  type      = "kubernetes"
  tune {
    max_lease_ttl = "4383h20m"
  }
}


# Create a k8s Auth role named for each Env "

#Roles for Integration ENV
resource "vault_kubernetes_auth_backend_role" "k8s_int_subsystem_role" {
  backend                          = vault_auth_backend.k8s_integration.path
  namespace                        = vault_namespace.integration.path_fq
  role_name                        = "k8s-int-role"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 28800
  token_policies                   = ["k8s-int--policy"]
}

#Roles for Dev ENV
resource "vault_kubernetes_auth_backend_role" "k8s_dev_subsystem_role" {
  backend                          = vault_auth_backend.k8s_development.path
  namespace                        = vault_namespace.development.path_fq
  role_name                        = "k8s-dev-role"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 28800
  token_policies                   = ["k8s-dev-policy"]
}

# #Roles for Scale ENV
resource "vault_kubernetes_auth_backend_role" "k8s_scale_subsystem_role" {
  backend                          = vault_auth_backend.k8s_scale.path
  namespace                        = vault_namespace.scale.path_fq
  role_name                        = "k8s-scale-role"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 28800
  token_policies                   = ["k8s-scale-policy"]
}
