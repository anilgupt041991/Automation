# Create Int-Subsystem-Role policy in the integration namespace
resource "vault_policy" "int_subsystem_policy" {
  depends_on = [vault_mount.kv-v2-integration]
  namespace  = vault_namespace.integration.path
  name       = "int-subsystem-policy"
  policy     = file("policies/Int-Subsystem-Role.hcl")
}

# Create Int-Subsystem-Customer_Role policy in the integration namespace
resource "vault_policy" "int-subsystem-customer-policy" {
  depends_on = [vault_mount.kv-v2-integration]
  namespace  = vault_namespace.integration.path
  name       = "int-subsystem-customer-policy"
  policy     = file("policies/Int-Subsystem-Customer-Role.hcl")
}

# Create Int-Onboarding-Role policy in the integration namespace
resource "vault_policy" "int_onboarding_policy" {
  depends_on = [vault_mount.kv-v2-integration]
  namespace  = vault_namespace.integration.path
  name       = "int-onboarding-policy"
  policy     = file("policies/Int-Onboarding-Role.hcl")
}


# Create Int-k8s policy in the integration
resource "vault_policy" "k8s_integration_policy" {
  depends_on = [vault_mount.kv-v2-integration]
  namespace  = vault_namespace.integration.path
  name       = "k8s-int-policy"
  policy     = file("policies/k8s-Int-Role.hcl")
}


# Create Dev-Subsystem-Role policy in the deveploment namespace
resource "vault_policy" "dev_subsystem_policy" {
  depends_on = [vault_mount.kv-v2-development]
  namespace  = vault_namespace.development.path
  name       = "dev-subsystem-policy"
  policy     = file("policies/Dev-Subsystem-Role.hcl")
}

# Create Dev-Subsystem-Customer_Role policy in the development namespace
resource "vault_policy" "dev-subsystem-customer-policy" {
  depends_on = [vault_mount.kv-v2-development]
  namespace  = vault_namespace.development.path
  name       = "dev-subsystem-customer-policy"
  policy     = file("policies/Dev-Subsystem-Customer-Role.hcl")
}

# Create Dev-Onboarding-Role policy in the development namespace
resource "vault_policy" "dev_onboarding_policy" {
  depends_on = [vault_mount.kv-v2-development]
  namespace  = vault_namespace.development.path
  name       = "dev-onboarding-policy"
  policy     = file("policies/Dev-Onboarding-Role-test.hcl")
}

# Create Dev-k8s policy in the development
resource "vault_policy" "k8s_development_policy" {
  depends_on = [vault_mount.kv-v2-development]
  namespace  = vault_namespace.development.path
  name       = "k8s-dev-policy"
  policy     = file("policies/k8s-dev-Role.hcl")
}

# Create Scale-Subsystem-Role policy in the scale namespace
resource "vault_policy" "scale_subsystem_policy" {
  depends_on = [vault_mount.kv-v2-scale]
  namespace  = vault_namespace.scale.path
  name       = "scale-subsystem-policy"
  policy     = file("policies/Scale-Subsystem-Role.hcl")
}

# Create Subsystem-Customer_Role policy in the scale namespace
resource "vault_policy" "scale_subsystem_customer_policy" {
  depends_on = [vault_mount.kv-v2-scale]
  namespace  = vault_namespace.scale.path
  name       = "scale-subsystem-customer-policy"
  policy     = file("policies/Scale-Subsystem-Role.hcl")
}

# Create Scale-Subsystem-Role policy in the scale namespace
resource "vault_policy" "scale_onboarding_policy" {
  depends_on = [vault_mount.kv-v2-scale]
  namespace  = vault_namespace.scale.path
  name       = "scale-onboarding-policy"
  policy     = file("policies/Scale-Onboarding-Role.hcl")
}

# Create Int-k8s policy in the scale
resource "vault_policy" "k8s_scale_policy" {
  depends_on = [vault_mount.kv-v2-scale]
  namespace  = vault_namespace.scale.path
  name       = "k8s-scale-policy"
  policy     = file("policies/k8s-scale-Role.hcl")
}

