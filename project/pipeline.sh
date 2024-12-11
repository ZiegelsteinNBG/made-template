#!/bin/bash

# needs to be on venv
# source ~/path/to/venv/bin/activate

export KAGGLE_USERNAME=$0
export KAGGLE_KEY=$1

# kaggle needs to be installed
if ! command -v kaggle &> /dev/null; then
    echo "Kaggle CLI is not installed. Please install it with 'pip install kaggle'"
    exit 1
fi

kaggle datasets download -d asaniczka/employment-to-population-ratio-for-usa-1979-2023
kaggle datasets download -d asaniczka/wages-by-education-in-the-usa-1973-2022

jv ./ProjectDataPipeline.jv

rm -r employment-to-population-ratio-for-usa-1979-2023.zip
rm -r wages-by-education-in-the-usa-1973-2022.zip

cd ..
mv ./project/combinedTable.sqlite ./data
