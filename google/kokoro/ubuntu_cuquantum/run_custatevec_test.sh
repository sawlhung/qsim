#!/bin/bash
set -e  # fail and exit on any command erroring
set -x  # print evaluated commands

apt-get -y install cmake python3-venv
# Create virtual env
python3 -m venv ./env
source env/bin/activate

# Run cuQuantum tests.
export CUQUANTUM_DIR=/workspace/cuquantum
export CUQUANTUM_ROOT=${CUQUANTUM_DIR}
export LD_LIBRARY_PATH=${CUQUANTUM_ROOT}/lib:${LD_LIBRARY_PATH}
# Error: git submodule update --init --recursive googletest
# fatal: detected dubious ownership in repository at '/workspace'
cd workspace
git config --global --add safe.directory '*'
make run-custatevec-tests
