#!/bin/bash
ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -10
