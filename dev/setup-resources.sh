#!/usr/bin/env bash

mkdir -p local
cd local
mkdir -p resources
cd resources
mkdir -p conf
cd conf
echo "environment=local
local.port=8080" > web-docs.properties
cd ../../..
