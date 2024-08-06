#!/bin/sh
set -e

git clone https://github.com/asdf-vm/asdf.git ${_REMOTE_USER_HOME}/.asdf --branch v0.14.0

echo ". \"${_REMOTE_USER_HOME}/.asdf/asdf.sh\"" >> ${_REMOTE_USER_HOME}/.zshrc

chown -R ${_REMOTE_USER}:${_REMOTE_USER} ${_REMOTE_USER_HOME}/.asdf
