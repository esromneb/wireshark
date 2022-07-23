#!/bin/bash

../../build/install/bin/sharkd - < ./sharkd_in1.txt | tee test1_output.txt

echo Diff:

diff test1_output_ideal.txt test1_output.txt; true

