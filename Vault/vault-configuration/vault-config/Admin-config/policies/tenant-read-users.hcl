# List namespaces
path "sys/namespaces/*" {
     capabilities = ["read", "list"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Allow GUI access-Its not needed its used by app to they will never login from UI
path "+/sys/capabilities-self" {
    capabilities = ["update"]
}

# Read-only secrets at 'Tenant1'
path "*" {
     capabilities = ["read", "list"]
}