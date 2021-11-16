#!/usr/bin/env bash

# First clean up the things (danger)
rm application_*.cpp 2>/dev/null

N_PROGRAMS=$1
for IDX in $(seq 0 $N_PROGRAMS); do
  cat <<EOF >application_${IDX}.cpp
#include <fmt/core.h>
int main() {
    fmt::print("Ready to hack #$IDX\n");
    return 0;
}
EOF
done
