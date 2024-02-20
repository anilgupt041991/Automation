# Enable and manage secrets engines
path "sys/mounts/*" {
     capabilities = ["create", "read", "update", "list"]
}

path "sys/auth/approle" {
     capabilities = ["create", "read", "update", "list"]
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
     capabilities = ["create", "read", "update", "list"]
}

# Manage tokens
path "auth/token/*" {
     capabilities = ["create", "read", "update", "list"]
}

# Manage approle Added by Anil
path "auth/approle/*" {
     capabilities = ["create", "read", "update", "list"]
}

# Manage secrets at 'Tenant1'
path "*" {
     capabilities = ["create", "read", "update", "list"]
}

#policy from codify
# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# Create, update, and delete auth methods in root 
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete"]
}

# Create, update, and delete auth methods in platform/customer ns
path "+/sys/auth/*"
{
  capabilities = ["create", "update", "delete"]
}

# Create, update, and delete auth methods in platform/customer ns
path "+/auth/*" {
  capabilities = ["create", "read", "update", "list"]
}

# Create, update, and delete auth methods in child ns in  platform/customer ns
path "+/+/sys/auth/*"
{
  capabilities = ["create", "update", "delete"]
}


# List auth methods
path "sys/auth"
{
  capabilities = ["create", "update", "read"]

}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# List, create, update, and delete key/value secrets at secret/
path "secret/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# Manage transit secrets engine
path "transit/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read"]
}


#Added the tenant-onboarding policy

# Manage namespaces (Delete is not needed , Sudo give root access)
path "sys/namespaces/*" {
     capabilities = ["create", "read", "update", "list"]
}

# Manage policies
path "sys/policies/acl/*" {
     capabilities = ["create","read", "update", "list"]
}

# List policies
path "sys/policies/acl" {
     capabilities = ["list"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
     capabilities = ["create","read", "update", "list"]
}

# List available secrets engines
path "sys/mounts" {
    capabilities = [ "read" ]
}

# Create and manage entities and groups
path "identity/*" {
     capabilities = ["create", "read", "update", "list"]
}

# Manage tokens
path "auth/token/*" {
     capabilities = ["create", "read", "update", "list"]
}

# Manage secrets at 'Tenant1', here Patch helps us to update the exsisting path keeping old
path "*" {
     capabilities = ["create", "read", "update", "list","patch"]
}



####
# Mount secrets engines
path "sys/mounts/*" {
  capabilities = [ "create", "read", "update", "list" ]
}

# Configure the database secrets engine and create roles
path "database/*" {
  capabilities = [ "create", "read", "update", "list" ]
}

# Manage the leases
path "sys/leases/+/database/creds/readonly/*" {
  capabilities = [ "create", "read", "update", "list" ]
}

path "sys/leases/+/database/creds/readonly" {
  capabilities = [ "create", "read", "update", "list" ]
}

# Write ACL policies
path "sys/policies/acl/*" {
  capabilities = [ "create", "read", "update", "list" ]
}

# Manage tokens for verification
path "auth/token/create" {
  capabilities = [ "create", "read", "update", "list" ]
}
