#!/bin/bash

#Below $1 is the Terraform SA passord which can be found in google docs
TOKEN=$(curl --insecure --request POST --data '{"password": "'"$1"'"}' https:///us-zsense.zscwp.io:8300/v1/auth/userpass/login/vault-sa-admin |  jq -r '.auth.client_token')

#Obtain Integration ENV Role_Id and Secret_Id valid for 6 months days from the day of creation
INT_SUBSYSTEM_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: integration/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/int-subsystem-role/role-id | jq -r '.data.role_id')
INT_SUBSYSTEM_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: integration/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/int-subsystem-role/secret-id | jq -r '.data.secret_id')
echo INT_SUBSYSTEM_ROLE_ID:$INT_SUBSYSTEM_ROLE_ID
echo INT_SUBSYSTEM_SECRET_ID:$INT_SUBSYSTEM_SECRET_ID

INT_SUBSYSTEM_CUSTOMER_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: integration/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/int-subsystem-customer-role/role-id | jq -r '.data.role_id')
INT_SUBSYSTEM_CUSTOMER_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: integration/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/int-subsystem-customer-role/secret-id | jq -r '.data.secret_id')
echo INT_SUBSYSTEM_CUSTOMER_ROLE_ID:$INT_SUBSYSTEM_CUSTOMER_ROLE_ID
echo INT_SUBSYSTEM_CUSTOMER_SECRET_ID:$INT_SUBSYSTEM_CUSTOMER_SECRET_ID

INT_ONBOARDING_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: integration/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/int-onboarding-role/role-id | jq -r '.data.role_id')
INT_ONBOARDING_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: integration/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/int-onboarding-role/secret-id | jq -r '.data.secret_id')
echo INT_ONBOARDING_ROLE_ID:$INT_ONBOARDING_ROLE_ID
echo INT_ONBOARDING_SECRET_ID:$INT_ONBOARDING_SECRET_ID


#Obtain DEV  Role_Id and Secret_Id valid for 32 days from the day of creation
DEV_SUBSYSTEM_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: development/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/dev-subsystem-role/role-id | jq -r '.data.role_id')
DEV_SUBSYSTEM_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: development/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/dev-subsystem-role/secret-id | jq -r '.data.secret_id')
echo DEV_SUBSYSTEM_ROLE_ID:$DEV_SUBSYSTEM_ROLE_ID
echo DEV_SUBSYSTEM_SECRET_ID:$DEV_SUBSYSTEM_SECRET_ID


DEV_SUBSYSTEM_CUSTOMER_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: development/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/dev-subsystem-customer-role/role-id | jq -r '.data.role_id')
DEV_SUBSYSTEM_CUSTOMER_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: development/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/dev-subsystem-customer-role/secret-id | jq -r '.data.secret_id')
echo DEV_SUBSYSTEM_CUSTOMER_ROLE_ID:$DEV_SUBSYSTEM_CUSTOMER_ROLE_ID
echo DEV_SUBSYSTEM_CUSTOMER_SECRET_ID:$DEV_SUBSYSTEM_CUSTOMER_SECRET_ID


DEV_ONBOARDING_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: development/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/dev-onboarding-role/role-id | jq -r '.data.role_id')
DEV_ONBOARDING_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: development/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/dev-onboarding-role/secret-id | jq -r '.data.secret_id')
echo DEV_ONBOARDING_ROLE_ID:$DEV_ONBOARDING_ROLE_ID
echo DEV_ONBOARDING_SECRET_ID:$DEV_ONBOARDING_SECRET_ID



#Obtain TENANT-OFFBOARDING_ Role_Id and Secret_Id valid for 32 days from the day of creation
SCALE_SUBSYSTEM_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: scale/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/scale-subsystem-role/role-id | jq -r '.data.role_id')
SCALE_SUBSYSTEM_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: scale/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/scale-subsystem-role/secret-id | jq -r '.data.secret_id')
echo SCALE_SUBSYSTEM_ROLE_ID:$SCALE_SUBSYSTEM_ROLE_ID
echo SCALE_SUBSYSTEM_SECRET_ID:$SCALE_SUBSYSTEM_SECRET_ID

SCALE_SUBSYSTEM_CUSTOMER_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: scale/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/scale-subsystem-customer-role/role-id | jq -r '.data.role_id')
SCALE_SUBSYSTEM_CUSTOMER_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: scale/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/scale-subsystem-customer-role/secret-id | jq -r '.data.secret_id')
echo SCALE_SUBSYSTEM_CUSTOMER_ROLE_ID:$SCALE_SUBSYSTEM_CUSTOMER_ROLE_ID
echo SCALE_SUBSYSTEM_CUSTOMER_SECRET_ID:$SCALE_SUBSYSTEM_CUSTOMER_SECRET_ID

SCALE_ONBOARDING_ROLE_ID=$(curl --insecure --header "X-Vault-Namespace: scale/" --header "X-Vault-Token: "$TOKEN"" https://us-zsense.zscwp.io:8300/v1/auth/approle/role/scale-onboarding-role/role-id | jq -r '.data.role_id')
SCALE_ONBOARDING_SECRET_ID=$(curl --insecure --header "X-Vault-Namespace: scale/" --header "X-Vault-Token:  "$TOKEN"" --request POST --data @payload.json https://us-zsense.zscwp.io:8300/v1/auth/approle/role/scale-onboarding-role/secret-id | jq -r '.data.secret_id')
echo SCALE_ONBOARDING_ROLE_ID:$SCALE_ONBOARDING_ROLE_ID
echo SCALE_ONBOARDING_SECRET_ID:$SCALE_ONBOARDING_SECRET_ID

# # Get secrets if it exsists
# aws secretsmanager get-secret-value --output text --query SecretString --secret-id ZPC-CSPM-ONBOARDING >> /tmp/null
# aws secretsmanager get-secret-value --output text --query SecretString --secret-id ZPC-TENTANT-ONBOARDING >> /tmp/null
# aws secretsmanager get-secret-value --output text --query SecretString --secret-id ZPC-TENANT-OFFBOARDING >> /tmp/null
# aws secretsmanager get-secret-value --output text --query SecretString --secret-id ZPC-TENANT-READONLY >> /tmp/null
# aws secretsmanager get-secret-value --output text --query SecretString --secret-id ZPC-PLATFORM-CSPM-ONBOARDING >> /tmp/null
# aws secretsmanager get-secret-value --output text --query SecretString --secret-id ZPC-PLATFORM-TENANT-READONLY >> /tmp/null
#  if [ $? -eq 0 ]; then
#    aws secretsmanager update-secret --secret-id ZPC-CSPM-ONBOARDING  --secret-string '{"secret_id":"'"$CSPM_ONBOARDING_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager update-secret --secret-id ZPC-TENTANT-ONBOARDING --secret-string '{"secret_id":"'"$TENTANT_ONBOARDING_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager update-secret --secret-id  ZPC-TENANT-OFFBOARDING --secret-string '{"secret_id":"'"$TENANT_OFFBOARDING_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager update-secret --secret-id ZPC-TENANT-READONLY  --secret-string '{"secret_id":"'"$TENANT_READONLY_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager update-secret --secret-id ZPC-PLATFORM-CSPM-ONBOARDING  --secret-string '{"secret_id":"'"$PLATFORM_CSPM_ONBOARDING_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager update-secret --secret-id ZPC-PLATFORM-TENANT-READONLY --secret-string '{"secret_id":"'"$PLATFORM_TENANT_READONLY_SECRET_ID"'"}' >> /tmp/null
# else
#    aws secretsmanager create-secret --name ZPC-CSPM-ONBOARDING --description "Secret_id for CSPM-ONBOARDING" --secret-string '{"secret_id":"'"$CSPM_ONBOARDING_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager create-secret --name ZPC-TENTANT-ONBOARDING --description "Secret_id for TENTANT-ONBOARDING" --secret-string '{"secret_id":"'"$TENTANT_ONBOARDING_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager create-secret --name ZPC-TENANT-OFFBOARDING  --description "Secret_id for TENANT_OFFBOARDING  " --secret-string '{"secret_id":"'"$TENANT_OFFBOARDING_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager create-secret --name ZPC-TENANT-READONLY  --description "Secret_id for TENANT-READONLY" --secret-string '{"secret_id":"'"$TENANT_READONLY_VAULT_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager create-secret --name ZPC-PLATFORM-CSPM-ONBOARDING   --description "Secret_id for PLATFORM-CSPM-ONBOARDING " --secret-string '{"secret_id":"'"$PLATFORM_CSPM_ONBOARDING_SECRET_ID"'"}' >> /tmp/null
#    aws secretsmanager create-secret --name ZPC-PLATFORM-TENANT-READONLY --description "Secret_id for PLATFORM-TENANT-READONLY " --secret-string '{"secret_id":"'"$PLATFORM_TENANT_READONLY_SECRET_ID"'"}' >> /tmp/null

# fi