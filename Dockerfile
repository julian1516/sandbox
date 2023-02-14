## Utilisez l'image Ubuntu 20.04 LTS comme base
FROM ubuntu:20.04

ARG VAULT_VERSION=1.6.0
ARG OPENSHIFT_VERSION=4.10.0

## Mettez à jour les paquets et télécharger wget et unzip
RUN apt-get update && apt-get install -y \
    curl=7.68.0-1ubuntu2.15 \
    wget=1.20.3-1ubuntu1 \
    unzip=6.0-25ubuntu1.1 

## Téléchargez le binaire d'Openshift versions ${OPENSHIFT_VERSION}
RUN wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OPENSHIFT_VERSION}/openshift-client-linux.tar.gz \
 && tar -xvf openshift-client-linux.tar.gz \
 && mv oc /usr/local/bin/ \
 && chmod +x /usr/local/bin/oc \
 && rm openshift-client-linux.tar.gz


## Télécharger et installer le binaire de Vault versions ${VAULT_VERSION}
RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
 && unzip vault_${VAULT_VERSION}_linux_amd64.zip \
 && mv vault /usr/local/bin/ \
 && chmod +x /usr/local/bin/vault \
 && rm vault_${VAULT_VERSION}_linux_amd64.zip

## Copie du script.sh présent dans le répertoire du dockerfile, changement des droits. A modifier 
ADD script.sh script.sh

# Donnez les droits d'exécution au script
RUN chmod +x /script.sh

# Définissez le script comme commande d'exécution par défaut pour le conteneur
ENTRYPOINT ["/script.sh"]