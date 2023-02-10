#!/usr/bin/bash

iverilog VCBBmCLED.v top.v -Wall -Wextra -o Reverse
./Reverse
