#!/usr/bin/bash

iverilog VCB4RE.v top.v -Wall -Wextra -o binsum
./binsum
