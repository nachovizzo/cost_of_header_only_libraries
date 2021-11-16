#!/usr/bin/env bash
# @file      generate_programs.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de
#
# Copyright (c) 2021 Ignacio Vizzo, all rights reserved
#
# Description:
#   This simple script takes only 1 input arguments (an integer number) and produces that amount
#   of C++ files as shown in the body of the for loop. It's not optimized since it's not the main
#   focus of this particular example.

# First clean up the things (danger)
rm application_*.cpp 2>/dev/null

# Read the input argument into a variable
N_PROGRAMS=$1

# Iterate, and produce N_PROGRAMS .cpp programs that does exactly the same (but with different name)
for IDX in $(seq 0 $N_PROGRAMS); do
  cat <<EOF >application_${IDX}.cpp
#include <fmt/core.h>
int main() {
    fmt::print("Ready to hack #$IDX\n");
    return 0;
}
EOF
done
