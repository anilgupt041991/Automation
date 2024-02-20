# List namespaces
path "sys/namespaces/integration/*" {
     capabilities = ["read","list"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Read-only secrets from integration/plaform ns common and subsystems path
path "integration/platform_common/common/*" {
     capabilities = ["read","list"]
}
path "integration/platform_common/subsystems/*" {
     capabilities = ["read","list"]
}

# Read and write from integration/platform_tenant/ ns and path subsystems/* 
path "integration/platform_tenant/integrations/*" {
     capabilities = ["read","list","create","update"]
}

# Read from integration/platform_tenant/ ns and subsystems/* 
path "integration/platform_tenant/subsystems/*" {
     capabilities = ["read","list"]
}

# Read from integration/platform_tenant/* 
path "integration/platform_tenant/*" {
     capabilities = ["read","list"]
}

#Added on 15 sep
path "platform_common/kv/+/subsystems" {
  capabilities = ["read"]
}

path "platform_common/kv/+/common" {
  capabilities = ["read"]
}

#Read and Write Tenant NS
path "tenant*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}

path "platform_tenant/*" {
    capabilities = ["create", "read", "update", "list", "patch"]
}

#tenant read
path "tenant/*" {
  capabilities = ["read"]
}

path "tenant*" {
  capabilities = ["read"]
}

### Oct 19 

path "platform_common/*" {
  capabilities = ["read"]
}

path "platform_common/+/*" {
  capabilities = ["read"]
}

path "platform_tenant/kv/+/*" {
  capabilities = ["read"]
}

path "tenant/kv/+/*" {
  capabilities = ["create", "read", "update", "delete", "list","patch"]
}