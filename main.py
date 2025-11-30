#!/usr/bin/env python3
import sys
import re

def main():
    pattern = re.compile(r'\d{10}')

    for line in sys.stdin:
        match = pattern.search(line)

        if match:
            print(f"Found: {match.group()}")

if __name__ == "__main__":
    main()
