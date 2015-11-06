#!/usr/bin/env bash

. deps/assert/assert.sh

total=$(wc -l build/Dictionaries.bundle/de/* | tail -1 | sift '(\d+)' --replace '$1')
assert "echo $total" '92666'

assert_end
