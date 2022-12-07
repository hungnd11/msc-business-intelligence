#!/bin/bash

MOVIELEN_25M="https://files.grouplens.org/datasets/movielens/ml-1m.zip"
CHECKSUM="https://files.grouplens.org/datasets/movielens/ml-1m.zip.md5"

MOVIELEN_25M_FILENAME=$(basename ${MOVIELEN_25M})
CHECKSUM_FILENAME=$(basename ${CHECKSUM})

if [[ ! -f "${MOVIELEN_25M_FILENAME}" ]]; then
    echo "Downloading ${MOVIELEN_25M_FILENAME}"
    wget ${MOVIELEN_25M}
else
    echo "File ${MOVIELEN_25M_FILENAME} exists!"
fi

if [[ ! -f "${CHECKSUM_FILENAME}" ]]; then
    echo "Downloading ${CHECKSUM_FILENAME}"
    wget ${CHECKSUM}
else
    echo "File ${CHECKSUM_FILENAME} exists!"
fi

# checking if the file was corrupted
md5sum -c ${CHECKSUM_FILENAME}