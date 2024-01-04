#!/bin/bash

# API_URI is the endpoint from which the JSON is fetched
API_URI=$1

if [ -z "$API_URI" ]; then
    echo "Error: API_URI is required but was not provided."
    echo "Usage: fetcher.sh <API_URI>"
    exit 1
fi

# STORE_DIR is the directory where fetched JSON files are stored
STORE_DIR=/tmp/fetcher

# FILE_NAME is the name of the file in which the fetched JSON is stored
FILE_NAME="file-$(date +%s).json"

if [ ! -d $STORE_DIR ]; then
    echo "STORE_DIR directory does not exist."
    echo "Creating STORE_DIR directory..."
    mkdir $STORE_DIR
    echo "Done."
fi

# STATUS_CODE is the HTTP resposne status code returned by the API
STATUS_CODE=$(curl -o $STORE_DIR/$FILE_NAME -w '%{http_code}' -s $API_URI)

if [ $STATUS_CODE -eq 200 ]; then
    echo "JSON file fetched successfully."
    cp $STORE_DIR/$FILE_NAME "$STORE_DIR/file.json"
    exit 0
else
    echo "Error: Unexpected HTTP response status."
    echo "  Expected: 200"
    echo "  Received: $STATUS_CODE"
    exit 1
fi
