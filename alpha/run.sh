#!/bin/bash

# Generate encryption keys
export ENCRYPTION_XKEY_SEED=$(wash keys gen curve -o json | jq -r '.seed')
export TRANSIT_XKEY_SEED=$(wash keys gen curve -o json | jq -r '.seed')

# generate tags
export WASM_HOSTNAME=$(hostname)
case $WASM_HOSTNAME in
    "alpha0")
    export ZONE=av-1a
    ;;
    "alpha1")
    export ZONE=av-2a
    ;;
    "alpha2")
    export ZONE=av-1b
    ;;
    "alpha3")
    export ZONE=av-2b
    ;;
    *)
    echo "Using default availability zone"
    export ZONE=av-x
    ;;
esac

# Launch environment
docker compose up -d