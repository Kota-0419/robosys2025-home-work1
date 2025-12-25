#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Kota Matsura <s24c1110qm@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

set -e

tmp=/tmp/$$

trap 'rm -f $tmp' EXIT

echo "Test 1: Unix timestamp conversion"

echo "Current: 1732950000" | ./clock > $tmp

if grep -q "2024-11-30 16:00:00" $tmp; then
    echo "OK"
else
    echo "NG"
    echo "Input: 1732950000"
    echo "Output:"
    cat $tmp
    exit 1
fi

exit 0
