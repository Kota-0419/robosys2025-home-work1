#!/usr/bin/env python3
import sys
import re
from datetime import datetime

def main():
    pattern = re.compile(r'\b(1[6-7]\d{8})(\.\d+)?\b')

    for line in sys.stdin:
        match = pattern.search(line)

        if match:
            ts_str = match.group()
            ts = float(ts_str)
            dt = datetime.fromtimestamp(ts)
            time_str = str(dt)

            time_str = str(dt)

            sys.stdout.write(new_line)
        else:
            sys.stdout.write(line)

if __name__ == "__main__":
    main()
