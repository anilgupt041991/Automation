#!/bin/bash

#To run this scrept your need to be connect the the cluster for example fro development env dev cluster should be connected in the Terminal in the main ns
#One time Migrating the k8s exsisting secrets from K8s secrets to Vault https://confluence.corp.zscaler.com/display/CWP/CWP+Secrets
#tenant_names = $(kubectl get secrets | grep tenant-secrets  | awk '{print $1}')
#$1 is ns per env like development,intergration or scale or prod and #2 is vault sa password

#Get names of all tenant
#kubectl get secrets | grep tenant-secrets  | awk '{print $1}' >>tenant_names.text

for tenant_name in $(cat tenant_names.text );
do
   NEO4J_ADMIN_USERNAME=$(kubectl get secrets/$tenant_name -o yaml | grep NEO4J_ADMIN_USERNAME | awk  -F":" '{ print $2 }')
   NEO4J_ADMIN_PASSWORD=$(kubectl get secrets/$tenant_name -o yaml | grep NEO4J_ADMIN_PASSWORD | awk  -F":" '{ print $2 }')
   SNOWFLAKE_ADMIN_ROLE=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_ADMIN_ROLE | awk  -F":" '{ print $2 }')
   SNOWFLAKE_ADMIN_USERNAME=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_ADMIN_USERNAME | awk  -F":" '{ print $2 }')
   SNOWFLAKE_PRIVATE_KEY=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_PRIVATE_KEY | awk  -F":" '{ print $2 }')
   SNOWFLAKE_PUBLIC_KEY=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_PUBLIC_KEY | awk  -F":" '{ print $2 }')
   echo $NEO4J_ADMIN_USERNAME
   export VAULT_ADDR='https://us-zsense.zscwp.io:8300'
   export VAULT_NAMESPACE=$1
   TOKEN=$(curl --insecure --request POST --data '{"password": "'"$2"'"}' https:///us-zsense.zscwp.io:8300/v1/auth/userpass/login/vault-sa-admin |  jq -r '.auth.client_token')
   
   curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: development/platform_tenant" \
    --request destroy \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$tenant_name/neo4j/admin_username


   curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: "$1"/platform_tenant" \
    --request destroy \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$tenant_name/neo4j/admin_password

  curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: "$1"/platform_tenant" \
    --request DELETE \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$tenant_name/snowflake/admin_username
 
 curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: "$1"/platform_tenant" \
    --request destroy \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$tenant_name/snowflake/admin_role

   curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: "$1"/platform_tenant" \
    --request destroy \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$tenant_name/snowflake/private_key



 curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: "$1"/platform_tenant" \
    --request DELETE \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$tenant_name/snowflake/public_key

done