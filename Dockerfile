## Utilisez l'image Alpine 3.17 comme base
FROM alpine:3.17

ARG CURL_VERSION=8.1.2-r0
ARG TKN_VERSION=0.31.1

## Installer les dépendances nécessaires
RUN apk add --no-cache curl=${CURL_VERSION}

## Télécharger et installer le binaire précompilé de Tekton CLI
RUN curl -LO https://github.com/tektoncd/cli/releases/download/v${TKN_VERSION}/tkn_${TKN_VERSION}_Linux_x86_64.tar.gz \
 && tar zxvf tkn_${TKN_VERSION}_Linux_x86_64.tar.gz -C /usr/local/bin tkn \
 && rm tkn_${TKN_VERSION}_Linux_x86_64.tar.gz
