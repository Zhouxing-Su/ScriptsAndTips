#!/bin/bash
# this script needs root privilege

# prerequisite
apt-get install libgmp-dev
apt-get install libzlib1g-dev
apt-get install libreadline-dev
apt-get install libncurses-dev

# compile
make
make gcg
make ug

# test
make test
