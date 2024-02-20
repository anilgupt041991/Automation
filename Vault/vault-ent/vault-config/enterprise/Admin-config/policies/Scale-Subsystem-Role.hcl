# List namespaces
path "sys/namespaces/scale/*" {
     capabilities = ["read","list"]
}

# List available secrets engines
path "sys/mounts/*" {
    capabilities = [ "read" ]
}

# Read-only secrets from scale/plaform ns and path common and subsystems
path "scale/platform_common/common/*" {
     capabilities = ["read","list"]
} 
path "scale/platform_common/subsystems/*" {
     capabilities = ["read","list"]
}

# Read and write from scale/platform_tenant/ ns and path integrations/* 
path "scale/platform_tenant/integrations/*" {
     capabilities = ["read", "list","create","update"]
}

# Read from scale/platform_tenant/ ns and path subsystems/* 
path "scale/platform_tenant/subsystems/*" {
     capabilities = ["read", "list"]
}

# Read from scale/platform_tenant/* 
path "scale/platform_tenant/*" {
     capabilities = ["read", "list"]
}


#Added Manually by anil sep 15 that is working

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


############# Oct 19 
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
  capabilities = ["read"]
}