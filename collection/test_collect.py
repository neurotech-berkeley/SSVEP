#!/usr/bin/env python2

import time
import random
from csv_collector import CSVCollector
import sys

fname = '{}'.format(sys.argv[1])
collector = CSVCollector(port='/dev/ttyUSB0', fname=fname)

collector.start()

print("get ready...")

print('---')
time.sleep(1)

print('--')
time.sleep(1)

print('-')
time.sleep(1)

print('go!')
collector.tag(1)

time.sleep(15)

collector.stop()
print('done!')
