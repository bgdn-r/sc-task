#!/bin/bash

# API_URI is the endpoint from which the quotes are fetched
API_URI=$1

if [ -z "$API_URI" ]; then
    echo "Error: API_URI is required but was not provided."
    echo "Usage: fetcher.sh <API_URI>"
    exit 1
fi

# QUOTE_DIR is the directory where fetched quotes are stored as JSON files
QUOTE_DIR=/tmp/quotes

# QUOTE_FILE is the name of the file in which the fetched quote is stored
QUOTE_FILE="quote.json"

if [ ! -d $QUOTE_DIR ]; then
    echo "QUOTE_DIR directory does not exist."
    echo "Creating QUOTE_DIR directory..."
    mkdir $QUOTE_DIR
    echo "Done."
fi

# STATUS_CODE is the HTTP resposne status code returned by the API
STATUS_CODE=$(curl -o $QUOTE_DIR/$QUOTE_FILE -w '%{http_code}' -s $API_URI)

if [ $STATUS_CODE -eq 200 ]; then
    echo "Quote fetched successfully."
    exit 0
else
    echo "Error: Unexpected HTTP response status."
    echo "  Expected: 200"
    echo "  Received: $STATUS_CODE"

    rm $QUOTE_DIR/$QUOTE_FILE

    echo "Exiting..."
    exit 1
fi
