# fetcher

Fetcher is a Bash script that executes an HTTP Get request on the provided
API endpoint and stores the JSON quote response in the `/tmp/quotes` directory
as `quote.json` file.

> Note: `API_URL` argument is required for the fetcher to run.

## Running the script

Executing a Get request on https://api.kanye.rest
```bash
fetcher.sh https://api.kanye.rest
```
