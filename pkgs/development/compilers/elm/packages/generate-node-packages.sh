#!/usr/bin/env bash

ROOT="$(realpath "$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"/../../../../..)"

set -eu -o pipefail

rm -f node-env.nix
$(nix-build $ROOT -A nodePackages.node2nix --no-out-link)/bin/node2nix \
    --nodejs-12 \
    -i node-packages.json \
    -o node-packages.nix \
    -c node-composition.nix \
    # TODO: Switch to the commented out version once nodejs package set gets updated to new node2nix
    -e node-env.nix
    # --no-copy-node-env -e ../../../node-packages/node-env.nix
