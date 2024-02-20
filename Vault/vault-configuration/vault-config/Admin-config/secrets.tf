#----------------------------------------------------------
# Enable secrets engines
#----------------------------------------------------------
# Enable kv-v2 secrets engine in the All namespaces
resource "vault_mount" "kv-v2-integration" {
  depends_on = [vault_namespace.integration]
  namespace  = vault_namespace.integration.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-integration-platform-common" {
  depends_on = [vault_namespace.integration]
  namespace  = vault_namespace.platform-common-integration.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-integration-platform-tenant" {
  depends_on = [vault_namespace.integration]
  namespace  = vault_namespace.platform-tenant-integration.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-integration-tenant" {
  depends_on = [vault_namespace.integration]
  namespace  = vault_namespace.tenant-integration.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-development" {
  depends_on = [vault_namespace.development]
  namespace  = vault_namespace.development.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-development-platform-common" {
  depends_on = [vault_namespace.development]
  namespace  = vault_namespace.platform-common-development.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-development-platform-tenant" {
  depends_on = [vault_namespace.development]
  namespace  = vault_namespace.platform-tenant-development.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-development-tenant" {
  depends_on = [vault_namespace.development]
  namespace  = vault_namespace.tenant-development.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-scale" {
  depends_on = [vault_namespace.scale]
  namespace  = vault_namespace.scale.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-scale-platform" {
  depends_on = [vault_namespace.scale]
  namespace  = vault_namespace.platform-common-scale.path_fq
  path       = "kv"
  type       = "kv-v2"
}

resource "vault_mount" "kv-v2-scale-platform-tenant" {
  depends_on = [vault_namespace.scale]
  namespace  = vault_namespace.platform-tenant-scale.path_fq
  path       = "kv"
  type       = "kv-v2"
}
resource "vault_mount" "kv-v2-scale-tenant" {
  depends_on = [vault_namespace.scale]
  namespace  = vault_namespace.tenant-scale.path_fq
  path       = "kv"
  type       = "kv-v2"
}