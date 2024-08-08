#!/bin/bash
set -e

install_kubectl() {
  if [ "${KUBECTL_INSTALL}" = false ]; then
    return 0
  fi

  if [ -z "${KUBECTL_VERSION}" ]; then
    exit 1
  else
    export ARCH=$(uname -m) \
      && if [ "$ARCH" = "x86_64" ]; then export KUBECTL_ARCH=x86_64 ; fi \
      && if [ "$ARCH" = "aarch64" ]; then export KUBECTL_ARCH=arm64 ; fi \
      && curl -LO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${KUBECTL_ARCH}/kubectl

    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  fi
}

install_flux() {
  if [ "${FLUX_INSTALL}" = false ]; then
    return 0
  fi

  if [ -z "${FLUX_VERSION}" ]; then
    exit 1
  else
    curl -sS https://raw.githubusercontent.com/fluxcd/flux2/v${FLUX_VERSION}/install/flux.sh | bash
  fi

  echo '. <(flux completion zsh)' >> ${_REMOTE_USER_HOME}/.zshrc
}

install_kubectl
install_flux
