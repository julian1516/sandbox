#!/bin/bash

# Récupération du secret
SECRET=$(oc get secrets/encryption-config -n etcd-secret-backup -o=jsonpath='{.data.encryption-config}' | base64 -d)

# Définition de l'adresse Vault et du token
VAULT_ADDR=https://10.247.65.21:8200
VAULT_TOKEN=hvs.CAESII1w3oX4AOIWONl7bzpLc-A36y02SKATmcDauw7Iv5faGigKImh2cy5xYjNUdEhva25GaU5BbHFwVDBNTFJOZTcuS0RKZjAQh-QL

# Connexion à Vault
vault login -address=$VAULT_ADDR -tls-skip-verify token=$VAULT_TOKEN


# Poussez le secret vers Vault
VAULT_NAMESPACE=automation vault kv get -tls-skip-verify -address=$VAULT_ADDR kv-v2/etcd-encryption-key
