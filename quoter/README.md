# quoter

Quoter is a Python script packaged as a Docker image that prints to the
standard output the quote from `quote.json` file, which *must* be mounted 
to `/tmp/quote.json` file when running the container.

Quote example:
```json
{
    "quote": "neki super kul quote"
}
```

## Building the Docker image
```bash
docker build -t quoter .
```

## Running the container
```bash
# Mount the quote.json file to container
docker run -v quote.json:/tmp/quote.json quoter
```

## Push the image to the registry
```bash
docker tag quoter <registry>/quoter:latest 
```
