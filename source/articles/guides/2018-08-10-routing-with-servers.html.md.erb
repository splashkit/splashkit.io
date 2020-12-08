---
title: Routing With Servers
date: 2018-08-10 05:43 UTC
tags: networking
author: Isaac Wallis
author_url: http://github.com/franknsten
summary: |
  This guide is an intruduction to delivering different content based on route requested
related_funcs:
  - start_web_server
  - stop_web_server
  - next_web_request
  - send_response
  - send_file_response
  - is_get_request_for
  - request_uri
  - request_uri_stubs
---

This article extends the skills gained from <%= link_to 'getting started with servers', '2018-07-14-getting-started-with-servers.html', :relative => true %>, specifically around serving different files for different paths

##Routing
Routing is an important part of the web server's job. This is how you get different pages depending on your requests for login, home, or about, pages on a site. Basically, a URL is structured **[serverName]:[port]/[route]**, for example **localhost:8080/login**

###Recap of servers
Start with this code, which we built in the introduction guide

<%= snippet "server_basic", "articles/guides/server/basic/" %>

This has the following information we need:

* ```server```, the web server on port 8080 we will be working with
* ```request```, the HTTP request that we're going to be sending responses to

### Preparing Pages
You should have an index.html file in ```Resources/server``` in your project folder, which we served to users last time. Create 3 copies, and name them login.html, about.html, contact.html. Edit the content inside the ```<p>``` tags to reflect the new names. You don't have to do anything too fancy, just add a message that identifies it as a different page. Your folder should now have the following files in it:

* index.html
* login.html
* about.html
* contact.html

### Checking Requests
Checking to see if a request has been made for a certain path is really easy! SplashKit provides a <%= link_for_function("is_get_request_for")%> function that lets you pass in a path, and it lets you know if the request is for that path. Alternately, you can also use <%= link_for_function("request_uri")%> or <%= link_for_function("request_uri_stubs")%> if you want to dynamically respond to the details in the request. <%= link_for_function("is_get_request_for")%> returns a boolean, True or False, which we can use in an if statement to check each of the resources we want to serve.

The following code shows the use of an if statement to serve some login text or the index page, depending on what the browser requested.

<%= snippet "server_routes0", "articles/guides/server/basic/" %>

### Handling Multiple Requests
You'll usually want your server to handle lots of requests, not just one then quit. The easiest way to do this is using a while loop that:

1. gets the next request
2. processes the request
3. sends an appropriate response

You can then add a special route that will stop the server.

The following code illustrates the use of the concepts covered so far. You can now make multiple requests in your browser, and you can navidate to [http://localhost:8080/quit] to get the web server to stop.

<%= snippet "server_routes", "articles/guides/server/basic/" %>

The html for your web page would be:

<%= snippet "routing_index", "articles/guides/server/basic/" %>

### Adding Links
You can add links to your ```index.html``` to link to the other pages we have created. The general syntax for links is 

```
<a href="pathToLinkTo">Text to be clicked</a>
```

For example, a link to the login page would look like

```
<p>
	<a href="login">Login Page</a> <br />
</p>
```

Add links to contact and about to index.html in this same manner, then try playing around with ```localhost:8080``` in your browser of choice, checking out all the different pages.

### What next?

With these concepts you should have enough to create a simple web server. You could make this more dynamic by reading details from the path in the URI, and then storing details within the program or in an associated database. The main thing to remember is that when you build a web server you need to wait for an incoming request, do some processing, and return a response.