---
title: Getting Started With Servers
date: 2018-07-14 08:09 UTC
tags: networking
author: Andrew Cain and Isaac Wallis
author_url: http://github.com/franknsten
summary: |
  This guide is an intruduction to using web servers
related_funcs:
  - start_web_server
  - has_incoming_web_requests
  - next_web_request
  - send_file_response
  - send_html_file_response
  - send_css_file_response
  - send_javascript_file_response
---

This article provides background information you will need to get started building your own web server using SplashKit. You will be introduced to starting a web server and serving a file to the user.

## Getting Started With Web Servers

Web browsers and servers are programs that make it possible for you to access resources and applications on the internet. When you navigate to a web page, your web browser (Chrome, Edge, FireFox, Safari) uses the URL your specify to open a network connection to a computer running somewhere on the internet. The browser's network connection allows it to send data to the server (called a request) and to receive data back in response.

For the computer you connected with to know what to do there must be a program that is listening for these requests and performing some actions in response. In this case that program is what we generally call a "web server". It has an open port (somewhere for others to connect to) and listens on that port for incoming connections. When the connection arrives, it can read the request, perform some actions, and respond.

In this article you will see how to start listening for connections, how to send a file in response, and how to stop listening for new connections. This is then build upon in the <%= link_to 'routing with servers', '2018-08-10-routing-with-servers.html', :relative => true %> article, which shows you how to customise your response based upon what the caller requested.

### Step 1: Getting Started

Before we start our server, lets create a file to be served. Create a new project folder (```mkdir testServer```) and move into it (```cd testServer```). We need to setup a resources folder where we can store files we want to "serve". You can do this by running ```skm resources``` at the Terminal. This will create the **Resources** folder, and all the subfolders in there. The folder we're interested in is **Resources/server** as this is where our server will look for files we want to present to the user.

Create a file in this folder, and fill it out like a basic HTML document as such:

<%= snippet "index_file", "articles/guides/server/basic/" %>

Save it as "index.html" in **Resources/server** and we are ready to start!

### Step 2: Starting The Server

To start listening for incomming connections you need to call the <%= link_for_function("start_web_server") %> procedure. You can pass a **port** value (integer) to this to indicate which port to listen for connections. Each computer can support multiple concurrent connections, so each needs a unique address, so there can only be one program using a given port at one time. To help make this easier to navigate there are standards for which port to use, and in general web servers listen on port 80 for insecure (http) traffic, and port 443 for secure (https) traffic, while secure shell (ssh; remote terminal access) is port 22 for example. For local web servers, it's standard to use port 8080.

We need to pair the <%= link_for_function("start_web_server") %> with a call to the <%= link_for_function("stop_web_server") %> procedure. This will wrap up any requests that have come in and will stop listening for any new requests. So once you are finished with the web server, you can stop it so that it does not take up system resources that you do not need. The following code shows a small program that starts and stops a web server.

<%= snippet "server_basic0", "articles/guides/server/basic/" %>

### Step 3: Responding to a request

<%= link_for_function("start_web_server") %> will get the computer to listen for incomming connections on port 8080. So now we need to tell it what to do when a request comes in. Each request needs to have a response, and the clients web browser will be waiting for this.

To send a response you can use the <%= link_for_function("send_response") %> procedure. There are several different versions of this, but the easiest allows you to send a string back as a response to the request. In order to send a response, we must wait to get the next incoming request. This is done by calling the <%= link_for_function("next_web_request") %> function. When you call this the computer will wait for the a request to come in to the web server, when it arrives the details are packaged up for us to use and sent back as an <%= link_for_type("http_request") %>. If you dont want to wait, you can check if there are requests before calling <%= link_for_function("next_web_request") %> by using calling the <%= link_for_function("has_incoming_requests") %> functions which will returns true if there is a request waiting.

The following code shows an appropriate ```"Hello World"``` web server program.

<%= snippet "server_basic1", "articles/guides/server/basic/" %>

Compile and run your program. Notice that when you run the program nothing seems to happen... The program is waiting for a request! To create a request navigate to [http://localhost:8080](http://localhost:8080) see you should see the response. When you switch back your program will have ended. Trying to make another request will no longer work, as there isn't any program listening for requests on port 8080.

### Step 4: Responding with the contents of a file

Often you will want to be able to respond with the contents of a file. To help make this easy, SplashKit provides a <%= link_for_function("send_file_response")%> procedure along with <%= link_for_function("send_html_file_response")%>, <%= link_for_function("send_css_file_response")%>, <%= link_for_function("send_javascript_file_response")%> to simplify responding with common web file types. When you respond with a file, SplashKit will search the program's Resources folder for the file you specify, and will then send the details from that file across the network as your response to the incoming request.

The follow code replaces the "Hello World" response with the details from the index.html file we created.

<%= snippet "server_basic", "articles/guides/server/basic/" %>

### Next Step

See how to respond to different requests in the <%= link_to 'routing with servers', '2018-08-10-routing-with-servers.html', :relative => true %> article.

