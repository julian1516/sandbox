#!/bin/bash

# Récupération du secret
SECRET=$(oc get secrets/encryption-config -n etcd-secret-backup -o=jsonpath='{.data.encryption-config}' | base64 -d)

# Définition de l'adresse Vault et du token
VAULT_ADDR=
VAULT_TOKEN=

# Connexion à Vault
vault login -address=$VAULT_ADDR -tls-skip-verify token=$VAULT_TOKEN


# Poussez le secret vers Vault
VAULT_NAMESPACE=automation vault kv get -tls-skip-verify -address=$VAULT_ADDR kv-v2/etcd-encryption-key
