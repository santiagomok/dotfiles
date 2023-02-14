#!/usr/bin/env bash

function _brew_installed_version() {
  local app=$1
  local version=$(brew info --json ${app} | jq -r '.[0].installed[0].version')
  echo "$app: $version (installed)"
}

_brew_installed_version $*

