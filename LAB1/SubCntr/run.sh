#!/usr/bin/bash

iverilog VCBDmSE.v top.v -Wall -Wextra -o subCntr
./subCntr
