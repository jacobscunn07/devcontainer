#!/bin/sh
set -e

if [ -z "${VERSION}" ]; then
  exit 1
else
  export ARCH=$(uname -m) \
    && if [ "$ARCH" = "x86_64" ]; then export KUBECTL_ARCH=x86_64 ; fi \
    && if [ "$ARCH" = "aarch64" ]; then export KUBECTL_ARCH=arm64 ; fi \
    && curl -LO https://dl.k8s.io/release/v${VERSION}/bin/linux/${KUBECTL_ARCH}/kubectl

  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
fi
