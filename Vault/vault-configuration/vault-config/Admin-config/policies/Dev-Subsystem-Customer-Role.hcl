# List namespaces
path "sys/namespaces/development/*" {
     capabilities = ["read","list"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Read-only secrets from development/plaform ns and path common and subsystems
path "development/platform_common/common/*" {
     capabilities = ["read","list"]
}
path "development/platform_common/subsystems/*" {
     capabilities = ["read","list"]
}

# Read and write from development/platform_tenant/ ns and path integrations/* 
path "development/platform_tenant/integrations/*" {
     capabilities = ["read","list","create","update"]
}

# Read from development/platform_tenant/ ns and path subsystems/* 
path "development/platform_tenant/subsystems/*" {
     capabilities = ["read","list"]
}

# Read from development/platform_tenant/* ns
path "development/platform_tenant/*" {
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