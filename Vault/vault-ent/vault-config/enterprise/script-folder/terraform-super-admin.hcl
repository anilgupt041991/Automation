# Enable and manage secrets engines
path "sys/mounts/*" {
     capabilities = ["create", "read", "update", "delete", "list"]
}

path "sys/auth/approle" {
     capabilities = ["create", "read", "update", "delete", "list"]
}

path "sys/auth/approle/*" {
  capabilities = [ "create", "read", "update", "delete" ]
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

# Manage approle Added by Anil
path "auth/approle/*" {
     capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets at 'Tenant1'
path "*" {
     capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

#policy from codify
# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods in root 
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# Create, update, and delete auth methods in platform/customer ns
path "+/sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# Create, update, and delete auth methods in platform/customer ns
path "+/auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods in child ns in  platform/customer ns
path "+/+/sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}


# List auth methods
path "sys/auth"
{
  capabilities = ["create", "update", "delete", "sudo", "read"]

}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# List, create, update, and delete key/value secrets at secret/
path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage transit secrets engine
path "transit/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}


#Added the tenant-onboarding policy

# Manage namespaces (Delete is not needed , Sudo give root access)
path "sys/namespaces/*" {
     capabilities = ["create", "delete", "read", "update", "list", "sudo"]
}

# Manage policies
path "sys/policies/acl/*" {
     capabilities = ["create","delete", "read", "update", "list", "sudo"]
}

# List policies
path "sys/policies/acl" {
     capabilities = ["list"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
     capabilities = ["create","delete", "read", "update", "list"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Create and manage entities and groups
path "identity/*" {
     capabilities = ["create", "delete", "read", "update", "list"]
}

# Manage tokens
path "auth/token/*" {
     capabilities = ["create", "read", "update", "list", "sudo"]
}

# Manage secrets at 'Tenant1', here Patch helps us to update the exsisting path keeping old
path "*" {
     capabilities = ["create", "read", "delete", "update", "list","patch"]
}
