#!/bin/bash
# SPDX-FileCopyrightText: 2025 Kota Matsura
# SPDX-License-Identifier: BSD-3-Clause


ng () {
      echo ${1}行目が違うよ
      res=1
}

res=0

out=$(echo "Current time: 1732950000" | ./clock)
[ "${out}" = "Current time: 2024-11-30 16:00:00" ] || ng "$LINENO"

out=$(echo "1798124400" | ./clock)
[ "${out}" = "2026-12-25 00:00:00" ] || ng "$LINENO"

out=$(echo "Date: 1770994800 (Valentine)" | ./clock)
[ "${out}" = "Date: 2026-02-14 00:00:00 (Valentine)" ] || ng "$LINENO"


out=$(echo "No timestamp here" | ./clock)
[ "${out}" = "No timestamp here" ] || ng "$LINENO"

out=$(echo "" | ./clock)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"


[ "$res" = 0 ] && echo OK
exit $res
