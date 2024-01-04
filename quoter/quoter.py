import json

# Path to quote file
file_path = "/tmp/quote.json"

try:
    with open(file_path, "r") as file:
        data = json.load(file)
        quote = data["quote"]

        if quote:
            print(quote)
        else:
            print("JSON key 'quote' is empty")

except FileNotFoundError:
    print(f"{file_path} file doesnt' exist")

except json.JSONDecodeError:
    print(f"Failed to decode JSON in {file_path} file")

except KeyError:
    print("JSON key 'quote' is missing")

except Exception as err:
    print(f"Unexpected error occurred: {err}")
