# vim: filetype=make

# Copy this file to Make.user and set some variables.

# This is the root of the software stack directory.
SOFTWARE_STACK_PROJECT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# What Spack should we use?
SPACK := /dev/shm/kraushm/spack/bin/spack

# The Spack installation root.
STORE := /mch-pe2207-dev0

# The temp folder to build in
TEMP_DIR := /dev/shm/kraushm/store.mch-pe2207-dev0

# Build in memory on /dev/shm/store, but bind it to /user-environment.
BWRAP := $(SOFTWARE_STACK_PROJECT)/bwrap-mutable-root.sh --tmpfs /tmp --tmpfs ~ --bind $(TEMP_DIR) $(STORE)

# Makes sure that make -Orecurse continues to print in color.
export SPACK_COLOR := always

# Look for compilers.yaml / packages.yaml in this directory. 
export SPACK_USER_CONFIG_PATH := $(SOFTWARE_STACK_PROJECT)/config/balfrin

# Put clingo and friends here...
export SPACK_USER_CACHE_PATH := $(SOFTWARE_STACK_PROJECT)/cache
