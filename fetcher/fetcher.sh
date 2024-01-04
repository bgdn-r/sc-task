#!/bin/bash

# API_URI is the endpoint from which the quotes are fetched
API_URI=$1

if [ -z "$API_URI" ]; then
    echo "Error: API_URI is required but was not provided."
    echo "Usage: fetcher.sh <API_URI>"
    exit 1
fi

# QUOTE_STORE is the directory where fetched quotes are stored as JSON files
QUOTE_STORE=/tmp/quotes

if [ ! -d $QUOTE_STORE ]; then
    echo "QUOTE_STORE directory does not exist."
    echo "Creating QUOTE_STORE directory..."
    mkdir $QUOTE_STORE
    echo "Done."
fi

# QUOTE is the name of the file in which the fetched quote is stored
QUOTE="quote.json"

# STATUS_CODE is the HTTP resposne status code returned by the API
STATUS_CODE=$(curl -o $QUOTE_STORE/$QUOTE -w '%{http_code}' -s $API_URI)

if [ $STATUS_CODE -eq 200 ]; then
    echo "Quote fetched successfully."
    exit 0
else
    echo "Error: Unexpected HTTP response status."
    echo "  Expected: 200"
    echo "  Received: $STATUS_CODE"

    rm $QUOTE_STORE/$QUOTE

    echo "Exiting..."
    exit 1
fi
