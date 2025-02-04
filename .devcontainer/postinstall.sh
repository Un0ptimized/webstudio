#!/bin/bash

echo "127.0.0.1 wstd.dev" >> /etc/hosts

sudo corepack enable
corepack install

pnpm config set store-dir $HOME/.pnpm-store

find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
find . -name 'lib' -type d -prune -exec rm -rf '{}' +
find . -name 'build' -type d -prune -exec rm -rf '{}' +
find . -name 'dist' -type d -prune -exec rm -rf '{}' +
find . -name '.cache' -type d -prune -exec rm -rf '{}' +
find . -name '.pnpm-store' -type d -prune -exec rm -rf '{}' +

pnpm install
pnpm run build
pnpm migrations migrate
pnpm dev
