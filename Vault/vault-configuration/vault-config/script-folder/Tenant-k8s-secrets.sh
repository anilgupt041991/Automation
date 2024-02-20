#!/bin/bash

#To run this scrept you need to be connect the the cluster for example fro development env dev cluster should be connected in the Terminal in the main ns
#One time Migrating the k8s exsisting secrets from K8s secrets to Vault https://confluence.corp.zscaler.com/display/CWP/CWP+Secrets
#tenant_names = $(kubectl get secrets | grep tenant-secrets  | awk '{print $1}')
#$1 is ns per env like development,intergration or scale or prod and #2 is vault sa password

#Get names of all tenant
#kubectl get secrets | grep tenant-secrets  | awk '{print $1}'  >>tenant_names.text

# #Iterate through each tenant
   for tenant_name in $(cat tenant_names.text );
   do
     #NEO4J_ADMIN_USERNAME=$(kubectl get secrets/$tenant_name -o yaml | grep NEO4J_ADMIN_USERNAME | awk  -F": " '{ print $2 }' | base64 --decode )
     #NEO4J_ADMIN_PASSWORD=$(kubectl get secrets/$tenant_name -o yaml | grep NEO4J_ADMIN_PASSWORD | awk  -F": " '{ print $2 }' | base64 --decode )
     SNOWFLAKE_ADMIN_ROLE=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_ADMIN_ROLE | awk  -F": " '{ print $2 }' | base64 --decode )
     SNOWFLAKE_ADMIN_USERNAME=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_ADMIN_USERNAME | awk  -F": " '{ print $2 }' | base64 --decode )
     SNOWFLAKE_PRIVATE_KEY=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_PRIVATE_KEY | awk  -F": " '{ print $2 }' | base64 --decode )
     SNOWFLAKE_PUBLIC_KEY=$(kubectl get secrets/$tenant_name -o yaml | grep SNOWFLAKE_PUBLIC_KEY | awk  -F": " '{ print $2 }' | base64 --decode )

      export VAULT_ADDR='https://us-zsense.zscwp.io:8300'
      export VAULT_NAMESPACE=$1
      TOKEN=$(curl --insecure --request POST --data '{"password": "'"$2"'"}' https:///us-zsense.zscwp.io:8300/v1/auth/userpass/login/vault-sa-admin |  jq -r '.auth.client_token')
      final_tenant_name=$(echo $tenant_name | awk -F"-" '{print $1}')
#    # curl \
#    #  --header "X-Vault-Token: $TOKEN" \
#    #  --header "X-Vault-Namespace: integration/platform_tenant" \
#    #  --request PUT \
#    #  -d '{"data":{"ADMIN_USERNAME": "'"$NEO4J_ADMIN_USERNAME"'","ADMIN_PASSWORD": "'"$NEO4J_ADMIN_PASSWORD"'" }}' \
#    #  https://us-zsense.zscwp.io:8300/v1/kv/data/$final_tenant_name/neo4j

   curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: integration/platform_tenant" \
    --request PUT \
    -d '{"data":{"ADMIN_USERNAME": "'"$SNOWFLAKE_ADMIN_USERNAME"'","ADMIN_ROLE": "'"$SNOWFLAKE_ADMIN_ROLE"'" }}' \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$final_tenant_name/snowflake
   
   echo '{ "data" : {"PRIVATE_KEY": "'$SNOWFLAKE_PRIVATE_KEY'","PUBLIC_KEY": "'$SNOWFLAKE_PUBLIC_KEY'"  }}' >> snow_secret.json

   curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "Content-Type: application/merge-patch+json" \
    --header "X-Vault-Namespace: integration/platform_tenant" \
    --request PATCH \
    --data @snow_secret.json \
    https://us-zsense.zscwp.io:8300/v1/kv/data/$final_tenant_name/snowflake
   
   # curl  \
   #  -H "X-Vault-Token: $TOKEN" \
   #  -H "X-Vault-Namespace: integration/platform_tenant" \
   #  -X DELETE \
   #  https://us-zsense.zscwp.io:8300/v1/kv/data/$final_tenant_name/snowflake

done