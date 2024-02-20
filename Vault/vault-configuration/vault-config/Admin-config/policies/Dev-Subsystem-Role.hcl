# # Manage namespaces
# path "sys/namespaces/*" {
#    capabilities = ["create", "read", "update", "list"]
# }

# # Manage policies
# path "sys/policies/acl/*" {
#    capabilities = ["create", "read", "update", "list"]
# }

# # Manage policies
# path "+/sys/policies/acl/*" {
#    capabilities = ["create", "read", "update", "list"]
# }

# # Manage policies
# path "+/+/sys/policies/acl/*" {
#    capabilities = ["create", "read", "update", "list"]
# }

# # List policies
# path "sys/policies/acl" {
#   capabilities = ["list"]
# }

# # Enable and manage secrets engines
# path "sys/mounts/*" {
#    capabilities = ["create", "read", "update", "list"]
# }

# # List available secrets engines
# path "sys/mounts" {
#   capabilities = [ "read" ]
# }

# # List available secrets engines
# path "+/sys/mounts" {
#   capabilities = [ "read" ]
# }

# # List available secrets engines
# path "+/+/sys/mounts" {
#   capabilities = [ "read" ]
# }

# # Create and manage entities and groups
# path "identity/*" {
#      capabilities = ["create", "read", "update", "delete", "list"]
# }

# # Create and manage entities and groups
# path "+/identity/*" {
#      capabilities = ["create", "read", "update", "delete", "list"]
# }

# # Create and manage entities and groups
# path "+/+/identity/*" {
#      capabilities = ["create", "read", "update", "delete", "list"]
# }

# # Manage tokens
# path "auth/token/*" {
#      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }

# # Manage tokens
# path "+/auth/token/*" {
#      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }

# # Manage tokens
# path "+/+/auth/token/*" {
#      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
# }


# # Create, update, and delete auth methods in platform_common/customer ns
# path "+/sys/auth/*"
# {
#   capabilities = ["create", "read", "update", "list"]
# }

# # Create, update, and delete auth methods in platform_common/customer ns
# path "+/auth/*" {
#   capabilities = ["create", "read", "update", "list"]
# }

# # Create, update, and delete auth methods in child ns in  platform_common/customer ns
# path "+/+/sys/auth/*"
# {
#   capabilities = ["create", "read", "update", "list"]
# }

# path "/sys/auth*" {
#     capabilities = ["create", "read", "update", "list", "sudo"]
# }

# # Create, update, and delete auth methods in child ns in  platform_common/customer ns
# path "+/+/sys/auth*" {
#     capabilities = ["create", "read", "update", "list", "sudo"]
# }

# # Create, update, and delete auth methods in platform_common/customer ns
# path "+/auth*" {
#   capabilities = ["create", "read", "update", "list"]
# }



# # Enable and manage secrets engines
# path "+/+/sys/mounts/*" {
#      capabilities = ["create", "read", "update", "list"]
# }

# path "+/sys/mounts/*" {
#      capabilities = ["create", "read", "update", "list"]
# }


# path "+/sys/auth/approle" {
#      capabilities = ["create", "read", "update", "list"]
# }

# path "+/+/sys/auth/approle" {
#      capabilities = ["create", "read", "update", "list"]
# }

# path "+/+/sys/auth/approle/*" {
#   capabilities = ["create", "read", "update", "list"]
# }

# path "+/sys/auth/approle/*" {
#   capabilities = ["create", "read", "update", "list"]
# }

# path "sys/capabilities-self"
# {
#   capabilities = ["create", "update", "read"]
# }

# path "+/sys/capabilities-self"
# {
#   capabilities = ["create", "update", "read"]
# }

# path "+/+/sys/capabilities-self"
# {
#   capabilities = ["create", "update", "read"]
# }


# #Role Specific Rules
# # Read-only secrets from development/plaform ns common and subsystems path
# path "development/platform_common/data/common/*" {
#      capabilities = ["read","list"]
# }

# # Read-only secrets from development/plaform ns common and subsystems path
# path "development/platform_common/data/subsystems/*" {
#      capabilities = ["read","list"]
# }

# # Read and create from development/tenant ns and path integrations/* 
# path "development/platform_tenant/data/integrations/*" {
#      capabilities = ["read","list","create","update"]
# }

# # Read from development/platform_tenant/ ns and path subsystems/* 
# path "development/platform_tenant/data/subsystems/*" {
#      capabilities = ["read","list"]
# }

# # Read from development/platform_tenant/*  ns 
# path "development/platform_tenant/*" {
#      capabilities = ["read","list"]
# }

######################################################Block all above##########

# #Added Manually by anil sep 15 that is working

# path "platform_common/kv/+/subsystems" {
#   capabilities = ["read"]
# }

# path "platform_common/kv/+/common" {
#   capabilities = ["read"]
# }

# #Read and Write Tenant NS
# path "tenant*" {
#   capabilities = ["create", "read", "update", "list", "patch"]
# }

# path "platform_tenant/*" {
#     capabilities = ["create", "read", "update", "list", "patch"]
# }

path "sys/namespaces/*" {
   capabilities = ["read"]
}

# Added Manually by anil Oct 19 CWP-30256

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