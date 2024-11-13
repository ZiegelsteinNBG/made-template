#!/bin/bash


export KAGGLE_USERNAME="nhatkhangvo"
export KAGGLE_KEY="d5c2f0cf28c4b01a8f405e3b4cfe55e1"

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