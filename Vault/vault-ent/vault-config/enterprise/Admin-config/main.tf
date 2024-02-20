##------------------------------------------------------------------------------
# The best practice is to use remote state file and encrypt it since your
# state files may contains sensitive data (secrets).
#------------------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket  = "cwp-np-security-vault-terraform-state-bucket"
    encrypt = true
    key     = "vault-np/terraform.tfstate"
    region  = "us-west-2"
  }
}

#-----------------------------------------------------------------------------------
# To configure Transform secrets engine, you need vault provider v2.12.0 or later
#-----------------------------------------------------------------------------------
terraform {
  required_providers {
    vault = "~> 3.7.0"
  }
}

#------------------------------------------------------------------------------
# To leverage more than one namespace, define a vault provider per namespace
#------------------------------------------------------------------------------

provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  address         = "https://us-zsense.zscwp.io:8300"
  skip_tls_verify = "true"
}


#------------------------------------------------------------------------------
# Create Parent NS: Integration
#------------------------------------------------------------------------------

resource "vault_namespace" "integration" {
  path = "integration"
}

# configure an aliased provider, scope to the integration namespace.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "integration"
  namespace = vault_namespace.integration.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}



#Child ns for integration
resource "vault_namespace" "platform-common-integration" {
  namespace = vault_namespace.integration.path
  path      = "platform_common"
}
# configure an aliased provider, scope to the child namespace platform-integration .
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "platform-common-integration"
  namespace = vault_namespace.integration.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}




resource "vault_namespace" "platform-tenant-integration" {
  namespace = vault_namespace.integration.path
  path      = "platform_tenant"
}

# configure an aliased provider, scope to the child namespace tenant inside integration NS .
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "platform-tenant-integration"
  namespace = vault_namespace.integration.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}




resource "vault_namespace" "tenant-integration" {
  namespace = vault_namespace.integration.path
  path      = "tenant"
}

# configure an aliased provider, scope to the child namespace tenant-customer-integration in integration NS .
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "tenant-integration"
  namespace = vault_namespace.integration.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}


#------------------------------------------------------------------------------
# Create Parent NS: Development
#------------------------------------------------------------------------------

resource "vault_namespace" "development" {
  path = "development"
}

# configure an aliased provider, scope to the integration namespace.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "development"
  namespace = vault_namespace.develoment.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}


#Child ns for development
resource "vault_namespace" "platform-common-development" {
  namespace = vault_namespace.development.path
  path      = "platform_common"
}

# configure an aliased provider, scope to the child namespace platform in parent ns development.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "platform-common-development"
  namespace = vault_namespace.integration.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}



resource "vault_namespace" "platform-tenant-development" {
  namespace = vault_namespace.development.path
  path      = "platform_tenant"
}

# configure an aliased provider, scope to the child namespace tenant  in parent ns development.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "platform-tenant-development"
  namespace = vault_namespace.develoment.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}




resource "vault_namespace" "tenant-development" {
  namespace = vault_namespace.development.path
  path      = "tenant"
}
# configure an aliased provider, scope to the child namespace tenant-customer  in parent ns development.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "tenant-development"
  namespace = vault_namespace.develoment.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}




#------------------------------------------------------------------------------
# Create Parent NS: Scale
#------------------------------------------------------------------------------

resource "vault_namespace" "scale" {
  path = "scale"
}

# configure an aliased provider, scope to the scale namespace.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "scale"
  namespace = vault_namespace.scale.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}

#Child ns for scale 
resource "vault_namespace" "platform-common-scale" {
  namespace = vault_namespace.scale.path
  path      = "platform_common"
}
# configure an aliased provider, scope to the child namespace platform-scale  in parent ns Scale.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "platform-common-scale"
  namespace = vault_namespace.scale.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}




resource "vault_namespace" "platform-tenant-scale" {
  namespace = vault_namespace.scale.path
  path      = "platform_tenant"
}
# configure an aliased provider, scope to the child namespace tenant-scale  in parent ns Scale.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "platform-tenant-scale"
  namespace = vault_namespace.scale.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}



resource "vault_namespace" "tenant-scale" {
  namespace = vault_namespace.scale.path
  path      = "tenant"
}
# configure an aliased provider, scope to the child namespace tenant-customer  in parent ns Scale.
provider "vault" {
  auth_login {
    path = "auth/userpass/login/vault-sa-admin"

    parameters = {
      password = var.login_password
      #pass as github secrets after we migrate to github actions
    }
  }
  alias     = "tenant-scale"
  namespace = vault_namespace.scale.path
  #Do not use this in Prod
  skip_tls_verify = "true"
  address         = "https://us-zsense.zscwp.io:8300"
}