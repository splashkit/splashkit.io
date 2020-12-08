#include "splashkit.h"

int main()
{
    write_line("About to start the server...");

    // Start a web server - defaults to listening to port 8080
    web_server web_server = start_web_server();

    write_line("Waiting for a request - navigate to http://localhost:8080");

    // Wait and get the first request that comes in
    http_request new_request = next_web_request(web_server);

    // Send a response back
    send_response(new_request, "Hello World");

    // For now we are done... so lets shutdown...
    stop_web_server(web_server);

    return 0;
}