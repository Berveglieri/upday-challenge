FROM golang:1.15.1-alpine AS builder

ARG KUSTOMIZE_VERSION=v3.8.9
ARG KUBECTL_VERSION=1.18.14

RUN apk add --no-cache --update curl tar \
    && curl -Lo /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x /usr/bin/kubectl \
    && curl -L "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" | tar xzvf - -C /usr/bin \
    && chmod +x /usr/bin/kustomize \
    && mkdir /build

WORKDIR /build
COPY . .

FROM jenkins/jnlp-slave:latest

COPY --from=builder /usr/bin/kustomize /usr/bin/kustomize
COPY --from=builder /usr/bin/kubectl /usr/bin/kubectl

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [""]