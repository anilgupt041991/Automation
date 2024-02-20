# Manage namespaces (Delete is not needed , Sudo give root access)
path "sys/namespaces/*" {
     capabilities = ["create", "read", "update", "list", "sudo","delete"]
}

# Manage policies
path "sys/policies/acl/*" {
     capabilities = ["create", "read", "update", "list", "sudo","delete"]
}

# List policies
path "sys/policies/acl" {
     capabilities = ["list"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
     capabilities = ["create", "read", "update", "list", "delete"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Create and manage entities and groups
path "identity/*" {
     capabilities = ["create", "read", "update", "list", "delete"]
}

# Manage tokens
path "auth/token/*" {
     capabilities = ["create", "read", "update", "list", "sudo", "delete"]
}

# Manage secrets at 'Tenant1', here Patch helps us to update the exsisting path keeping old
path "*" {
     capabilities = ["create", "read", "update", "list","patch", "delete"]
}
