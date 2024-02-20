# List namespaces
path "sys/namespaces/development/*" {
     capabilities = ["read", "list"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Read-only secrets from development/plaform ns and path common
path "development/platform_common/common/*" {
     capabilities = ["read","list","create","update"]
}

# Read and write  secrets from development/plaform ns and path subsystems
path "development/platform_common/subsystems/*" {
     capabilities = ["read","list","create","update"]
}

# Read and write from development/platform_tenant/ ns and path integrations/* 
path "development/platform_tenant/integrations/*" {
     capabilities = ["read","list","create","update"]
}

# Read from development/platform_tenant/ ns and path subsystems/* 
path "development/platform_tenant/subsystems/*" {
     capabilities = ["read","list"]
}

# Read from development/platform_tenant/*  ns and path ******** Here is confusion
path "development/platform_tenant/*" {
     capabilities = ["read","list","create","update"]
}


#Added on 15 sep

#plaform/subsystems Read and Write For platform_common ns
path "platform_common/kv/+/subsystems" {
  capabilities = ["create", "read", "update", "list", "patch"]
}

path "platform_common/kv/+/common" {
  capabilities = ["create", "read", "update", "list", "patch"]
}

#Read and Write Tenant NS
# path "platform_tenant/kv/+/integrations" {
#   capabilities = ["create", "read", "update", "list", "patch"]
# }

# path "platform_tenant/kv/+/subsystems" {
#   capabilities = ["read"]
# }

path "tenant*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}

path "platform_tenant/*" {
    capabilities = ["create", "read", "update", "list", "patch"]
}

#tenant NS read and write
path "tenant/*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}

path "tenant*" {
  capabilities = ["create", "read", "update", "list", "patch"]
}

# All Path read access to Childns for Dev Role
path "platform_tenant/kv/data/*" {
  capabilities = ["create", "read", "update", "list", "patch", "delete"]
 }

path "tenant/kv/data/*" {
  capabilities = ["create", "read", "update", "list", "patch", "delete"]
 }

path "platform_common/kv/data/*" {
  capabilities = ["create", "read", "update", "list", "patch", "delete"]
 }

