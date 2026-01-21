#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Kota Matsura <s24c1110qm@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause


ng () {
      echo ${1}行目が違うよ
      res=1
}

res=0

out=$(echo "Current time: 1732950000" | ./clock)
[ "${out}" = "Current time: 2024-11-30 16:00:00" ] || ng "$LINENO"

<<<<<<< HEAD
out=$(echo "1798124400" | ./clock)
[ "${out}" = "2026-12-25 00:00:00" ] || ng "$LINENO"
=======
echo "Current: 1732950000" | ./clock > $tmp
>>>>>>> ae2d5407175140d1382726bb5d72f4f2392886df

out=$(echo "Date: 1770994800 (Valentine)" | ./clock)
[ "${out}" = "Date: 2026-02-14 00:00:00 (Valentine)" ] || ng "$LINENO"


out=$(echo "No timestamp here" | ./clock)
[ "${out}" = "No timestamp here" ] || ng "$LINENO"

out=$(echo "" | ./clock)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"


[ "$res" = 0 ] && echo OK
exit $res
