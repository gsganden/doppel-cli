#!/bin/bash

# failure is a natural part of life
set -e

OUT_DIR=${1}
SUMMARY_FILE=${OUT_DIR}/successful_r_packages.txt

R_LIB=$(
    Rscript -e "cat(.libPaths()[1])"
)
ALL_R_PACKAGES=$(ls ${R_LIB})
NUM_PACKAGES=$(echo ${ALL_R_PACKAGES} | wc -w)

echo "You have ${NUM_PACKAGES} R packages installed."

# Randomly select packages and start working through them
RANDOM_PACKAGES=$(
    echo $ALL_R_PACKAGES | tr ' ' "\n" | sort --sort=random
)

for pkg in ${RANDOM_PACKAGES}; do

    echo "Running doppel on package: ${pkg}"

    doppel-describe \
        --language R \
        --data-dir ${OUT_DIR} \
        -p ${pkg}

    echo ${pkg} >> ${SUMMARY_FILE}
done
