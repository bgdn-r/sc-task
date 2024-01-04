# fetcher

Fetcher is a Bash script that executes an HTTP Get request on the provided
API endpoint and stores the JSON response in the `/tmp/store` directory
as `file.json` file.

> Note: `API_URL` argument is required for the fetcher to run.

## Running the script

Executing a Get request on http://example.com
```bash
fetcher.sh http://example.com
```
