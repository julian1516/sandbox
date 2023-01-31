#!/bin/bash

# Récupération du secret
SECRET=$(oc get secrets/encryption-config -n etcd-secret-backup -o=jsonpath='{.data.encryption-config}' | base64 -d)

# Définition de l'adresse Vault
VAULT_ADDR=https://10.247.65.21:8200

# login puis Poussez le secret vers Vault
#curl --request POST --data "$SECRET" "$VAULT_ADDR/v1/secret/data/encryption-config"

vault login -address=https://10.247.65.21:8200 -tls-skip-verify
VAULT_NAMESPACE=automation vault kv get -tls-skip-verify -address=https://10.247.65.21:8200 kv-v2/etcd-encryption-key
