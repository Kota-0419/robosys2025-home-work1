#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Kota Matsura <s24c1110qm@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
      echo ${1}行目が違うよ
      res=1
}

res=0

out=$(seq 5 | ./main)
[ "${out}" = 15 ] || ng ${LINENO}

out=$(echo "10 20 30" | tr ' ' '\n' | ./main)
[ "${out}" = 60 ] || ng ${LINENO}

out=$(echo a | ./main > /dev/null 2>&1)
if [ "$?" = 1 ]; then
      echo "Error handling OK (non-number input)"
else
      ng ${LINENO}
fi

out=$(echo | ./main > /dev/null 2>&1)
if [ "$?" = 1 ]; then
      echo "Error handling OK (empty input)"
else
      ng ${LINENO}
fi

[ "${res}" = 0 ] && echo OK
exit $res
