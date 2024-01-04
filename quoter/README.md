# quoter

Quoter is a python script packaged as a Docker image that prints the
mounted quote to the standard output.

The quote is mounted as a Docker volume and read by the script.

Quote example:
```json
{
    "quote": "Some funny qoute goes here :)"
}
```

## Building the Docker image
```bash
docker build -t quoter .
```

## Running the container
```bash
# Mount the quote.json file to container
docker run -v /tmp/quotes/quote.json:/tmp/quote.json quoter
```
