#!/usr/bin/env python

import sys
import time

if len(sys.argv) != 2:
    print("usage: fillmem <number-of-megabytes>")
    sys.exit()

count = int(sys.argv[1])

data = []

for _ in range(count):
    for _ in range(10):
        data.append(([0 for x in range((10 * 1024))]))
        time.sleep(0.0001)
