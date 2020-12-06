import requests

# Get a list of JSON web resources
response = requests.get('https://jsonplaceholder.typicode.com/posts/')

# Output the response
if response.status_code == 200:
  for i in response.json():
    for key, value in i.items():
      print("{0} => {1}".format(key, value))
