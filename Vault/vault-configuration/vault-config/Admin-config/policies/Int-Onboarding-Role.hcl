# List namespaces
path "sys/namespaces/integration/*" {
     capabilities = ["read","list"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Read-only secrets from integration/plaform ns and path common
path "integration/platform_common/common/*" {
     capabilities = ["read","list"]
}

# Read and write secrets from integration/plaform ns and path subsystems
path "integration/platform_common/subsystems/*" {
     capabilities = ["read","list","create","update"]
}

# Read and write from integration/platform_tenant/ ns and path integrations/* 
path "integration/platform_tenant/integrations/*" {
     capabilities = ["read","list","create","update"]
}

# Read from integration/platform_tenant/ ns and path subsystems/* 
path "integration/platform_tenant/subsystems/*" {
     capabilities = ["read","list"]
}

# Read  and write from integration/platform_tenant/* ns and path **** Here is confusion
path "integration/platform_tenant/*" {
     capabilities = ["read","list","create","update"]
}


#Added on 15 sep

#plaform/subsystems Read and Write
path "platform_common/kv/+/subsystems" {
  capabilities = ["create", "read", "update", "list", "patch"]
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

#tenant read and write
path "tenant/*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}

path "tenant*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}


############# Oct 19 
path "platform_common/*" {
  capabilities = ["read"]
}

path "platform_common/+/*" {
  capabilities = ["read"]
}

path "platform_tenant/kv/+/*" {
  capabilities = ["create", "read", "update", "delete", "list","patch"]
}

path "tenant/kv/+/*" {
  capabilities = ["read"]
}