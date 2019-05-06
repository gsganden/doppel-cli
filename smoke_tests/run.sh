#!/bin/bash

# Failure is a natural part of life
set -e

OUT_DIR=$(pwd)/test_data
SUMMARY_FILE=${OUT_DIR}/results.txt

# Function to run doppel-describe
# [usage]
#     run_describe ${LANGUAGE} ${OUT_DIR} ${PKG} ${SUMMARY_FILE}
run_describe () {
    {
        doppel-describe \
            --language ${1} \
            --data-dir ${2} \
            -p ${3} && \
        echo "SUCCESS: ${pkg}" >> ${4}
    } || {
        echo "FAILURE: ${pkg}" >> ${4}
    }
}

mkdir -p ${OUT_DIR}

echo "Test results:" > ${SUMMARY_FILE}

echo "====================="
echo "== Python packages =="
echo "====================="
echo ""
for pkg in $(cat python_packages); do
    run_describe "python" ${OUT_DIR} ${pkg} ${SUMMARY_FILE}
done

echo ""
echo "================"
echo "== R packages =="
echo "================"
echo ""
for pkg in $(cat r_packages); do
    run_describe "r" ${OUT_DIR} ${pkg} ${SUMMARY_FILE}
done

SUCCESSES=$(cat ${SUMMARY_FILE} | grep SUCCESS | wc -l)
FAILURES=$(cat ${SUMMARY_FILE} | grep FAILURE | wc -l)

echo ""
echo "Smoke tests complete"
echo "Successes: ${SUCCESSES}"
echo "Failures: ${FAILURES}"
