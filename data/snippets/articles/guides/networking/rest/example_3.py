import requests

url = 'https://jsonplaceholder.typicode.com/posts/'
# Create the JSON body for the http post call
body = {
  'title':'foo',
  'body':'Test Entry',
  'userId':1
  }
# Create a JSON Web resource
response = requests.post(url, json=body)

# Output the response
if response.status_code == 201:
  for key, value in response.json().items():
    print("{0} => {1}".format(key, value))