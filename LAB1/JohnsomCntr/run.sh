#!/usr/bin/bash

iverilog VCJmRE.v top.v -Wall -Wextra -o Johnson
./Johnson
