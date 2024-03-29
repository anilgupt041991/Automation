#/bin/bash

# SERVICE is the name of the Vault service in Kubernetes.
# It does not have to match the actual running service, though it may help for consistency.
export SERVICE=vault-server-tls

# NAMESPACE where the Vault service is running.
export NAMESPACE=vault

# SECRET_NAME to create in the Kubernetes secrets store.
export SECRET_NAME=vault-server-tls
#
# TMPDIR is a temporary working directory.
export TMPDIR=/tmp

# CSR_NAME will be the name of our certificate signing request as seen by Kubernetes.
export CSR_NAME=vault-csr

#
secret=$(cat ./vault.hclic)
kubectl create secret generic vault-ent-license --from-literal="license=${secret}"


#self signed
openssl genrsa -out ${TMPDIR}/vault.key 2048

cat <<EOF >${TMPDIR}/csr.conf
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = ${SERVICE}
DNS.2 = ${SERVICE}.${NAMESPACE}
DNS.3 = ${SERVICE}.${NAMESPACE}.svc
DNS.4 = ${SERVICE}.${NAMESPACE}.svc.cluster.local
DNS.5 = *.vault
DNS.6 = *.us-west-2.elb.amazonaws.com
DNS.7 = vault-node.zscwp.io"
IP.1 = 127.0.0.1
EOF


openssl req -new -key ${TMPDIR}/vault.key \
    -subj "/O=system:nodes/CN=system:node:${SERVICE}.${NAMESPACE}.svc" \
    -out ${TMPDIR}/server.csr \
    -config ${TMPDIR}/csr.conf

cat <<EOF >${TMPDIR}/csr.yaml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: ${CSR_NAME}
spec:
  groups:
  - system:authenticated
  request: $(cat ${TMPDIR}/server.csr | base64 | tr -d '\r\n')
  signerName: beta.eks.amazonaws.com/app-serving
  usages:
  - digital signature
  - key encipherment
  - server auth
EOF

kubectl create -f ${TMPDIR}/csr.yaml

kubectl certificate approve ${CSR_NAME}

serverCert=$(kubectl get csr ${CSR_NAME} -o jsonpath='{.status.certificate}')

echo "${serverCert}" | openssl base64 -d -A -out ${TMPDIR}/vault.crt

kubectl config view --raw --minify --flatten -o jsonpath='{.clusters[].cluster.certificate-authority-data}' | base64 -d > ${TMPDIR}/vault.ca

kubectl create secret generic ${SECRET_NAME} \
    --namespace ${NAMESPACE} \
    --from-file=vault.key=${TMPDIR}/vault.key \
    --from-file=vault.crt=${TMPDIR}/vault.crt \
    --from-file=vault.ca=${TMPDIR}/vault.ca

# secret/vault-server-tls created


# new Cert changes this needs to be install on all cluster like dev,scale,INt and on Vault server too.
 kubectl create secret generic vault-server-tls \
    --from-file=vault.key=/Users/anilgupta/github/cwp-np-vault-deployment/vault-ent/vault-helm-chart/vault.key \
    --from-file=vault.crt=/Users/anilgupta/github/cwp-np-vault-deployment/vault-ent/vault-helm-chart/vault.crt \
    --from-file=vault.ca=/Users/anilgupta/github/cwp-np-vault-deployment/vault-ent/vault-helm-chart/vault.ca