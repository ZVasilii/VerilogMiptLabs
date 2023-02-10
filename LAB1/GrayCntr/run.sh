#!/usr/bin/bash

iverilog VCGrey4RE.v top.v -Wall -Wextra -o Grey
./Grey
