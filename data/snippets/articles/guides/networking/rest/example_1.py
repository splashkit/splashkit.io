import requests

# Get a single JSON web resource
response = requests.get('https://jsonplaceholder.typicode.com/posts/1')

# Output the response
if response.status_code == 200:
  for key, value in response.json().items():
    print("{0} => {1}".format(key, value))