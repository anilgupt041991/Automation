# Enable and manage secrets engines
path "sys/mounts/*" {
     capabilities = ["create", "read", "update", "delete", "list"]
}
# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Create and manage entities and groups
path "identity/*" {
     capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage tokens
path "auth/token/*" {
     capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets at 'Tenant1'
path "*" {
     capabilities = ["create", "read", "update", "delete", "list"]
}

