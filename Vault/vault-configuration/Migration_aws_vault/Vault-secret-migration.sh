#!/bin/bash

# If migrating dev secrets get aws creditails from Dev aws account
# Get secrets from Secrets manager $1 secret id like dev/common/kafka for dev and int/common/kafka and $2 env like development,integration and scale $3 is the terraform sa account password $4 is the child ns can be platform,tenant or tenant-customer $5 is path in Vault
SECRET=$(aws secretsmanager get-secret-value --output text --query SecretString --secret-id $1 | jq)
echo '{ "data" : '$SECRET' }' > secret.json

# #Push the secrets to Vault
export VAULT_ADDR='https://euc1-zsense.zpccloud.net:8300/'
export VAULT_NAMESPACE=$2

#Below $1 is the Terraform SA passord which can be found in google docs
TOKEN=$(curl --insecure --request POST --data '{"password": "'"$3"'"}' https://euc1-zsense.zpccloud.net:8300/v1/auth/userpass/login/eu-prod-vault-sa-admin |  jq -r '.auth.client_token')
echo $TOKEN

curl \
    --header "X-Vault-Token: $TOKEN" \
    --header "X-Vault-Namespace: $2/$4" \
    --request POST \
    --data @secret.json \
    https://euc1-zsense.zpccloud.net:8300/v1/kv/data/$5