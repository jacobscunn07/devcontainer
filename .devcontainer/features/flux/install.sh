#!/bin/sh
set -e

if [ -z "${VERSION}" ]; then
  exit 1
else
  curl -sS https://raw.githubusercontent.com/fluxcd/flux2/v${VERSION}/install/flux.sh | bash
fi

echo '. <(flux completion zsh)' >> ${_REMOTE_USER_HOME}/.zshrc
