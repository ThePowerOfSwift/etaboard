#!/usr/bin/env bash

for f in "$1"/*.txt ; do sed -ni r<(sort $f | uniq) $f ; done
