#!/usr/bin/env bash

. deps/assert/assert.sh

total=$(wc -l build/Dictionaries.bundle/de/* | tail -1 | sift '(\d+)' --replace '$1')
assert_raises "[ $total -gt 80000 ]"

assert_end
