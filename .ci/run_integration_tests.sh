#!/bin/bash

# [description]
#     Run doppel-cli integration tests. These are
#     primarily intended to test the analyze.* scripts
#     in doppel/bin. Their responsibility is to confirm
#     that the correct file content is generated by running
#     doppel-describe.
# [usage]
#     ./install_tests_packages.sh
#     ./run_integration_tests.sh $(pwd)/test_data

export TEST_DATA_DIR=${1}
export TEST_PACKAGE_NAME="testpkguno"

# failure is a natural part of life
set -e

echo ""
echo "Running integration tests"
echo ""
    
    DOPPEL_LOC=$(
      dirname $(
          python3 -c 'import doppel; print(doppel.__file__)' \
      )
    )

    pushd $(pwd)/integration_tests/python_tests
        pytest \
            --cache-clear
    popd

echo ""
echo "Done running integration tests"
echo ""