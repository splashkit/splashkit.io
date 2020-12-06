---

title: How to make a RESTful API call using Splashkit
date: 2018-10-03 12:00 UTC
author: Cyrill Illi
author_url:
tags: networking
summary: |
  In the world of web services and microservices many companies make their data availlable through a REST API.
  In this document we want to use Splashkit to make a RESTful API call.
related_funcs:
  - http_get
  - http_post
  - http_response_to_string
  - free_response
  - json_from_string
  - json_read_*
  - create_json
  - json_set_*
  - json_to_string

---

In the world of web services and microservices many companies make their data availlable through a REST API, like twitter, google, weather channels, stock market movement etc. This allows 3rd party software to utilize this data within their own application with a simple API call. In this document we want to use the Networking and JSON [Splashkit Library](https://www.splashkit.io) functions to make a RESTful API call.

REST is an acronym for REpresentational State Transfer which means a client’s API call will be answered with a representation of the requested resources state. For example if I were to request data for a particular stock market company I might get the name of the company, the abbreviation on the market, the share value, and whether it has gone up or down since the last refresh. This data represents the state of the resource.

In order to make a HTTP REST call two parameters must be passed along, one the resource that is requested which is embedded in the URL, and two, the operation you want to perform like [GET](#get), [POST](#post), PUT, DELETE. The Splashkit network library supports the first two.

A REST request data transfer can be in a JSON format, but other formats such as XML or HTTP are possible and often multiple formats are supported by a RESTful API server. In this document we are using the JSON format to represent both the data we send and receive. Which format we wish to use for the transfer is defined in the header of the HTTP request see [example 3](#post).

### Test JSON Server
The following code examples make use of the [JSONPlaceholder](https://jsonplaceholder.typicode.com) to test the code. In the examples we use the /posts resource which contain 100 posts. Each post contains the following elements:

- id
- userId
- title
- body

## <a name="get"></a>Example 1: GET Resource
In this first example we make use of a simple GET operation to retrieve a single resource from an REST API server. The URL tells us which resource to request, in this case it's the 1st post. The response is converted to a string and the the HTTP response must be set free. The string now contains the JSON response, but to call the key value pairs in the string it must be converted to a JSON object.

<%= snippet "example_1", "articles/guides/networking/rest/" %>

## Example 2: GET Resources
Once more we use the GET operator, but this time we request all the post. The response string now contains 100 posts. In order to convert them we would need to split the string into a vector and convert each response to a JSON object. This is not done in the example since the Splashkit has no split function instead we output the string.

<%= snippet "example_2", "articles/guides/networking/rest/" %>

## <a name="post"></a>Example 3: POST Resource
In this example we create a resource on the remote server by using the POST operation. This request requires the header definition specified the content type and the charset. This header must be within a vector as specified in the Splashkit documentation. The data is formed as a JSON object that is converted to a string for the purpose of the HTTP request. Note that the body only contains three parameters as the id is generated on the server.

<%= snippet "example_3", "articles/guides/networking/rest/" %>
