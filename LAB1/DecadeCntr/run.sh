#!/usr/bin/bash

iverilog VCD4RE.v top.v -Wall -Wextra -o Decade
./Decade
