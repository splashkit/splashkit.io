#include "splashkit.h"

int main()
{
    write_line("About to start the server...");
    
    // Start a web server - defaults to listening to port 8080
    web_server server = web_server();

    write_line("Waiting for a request - navigate to http://localhost:8080");

    // Wait and get the first request that comes in
    http_request request = next_web_request(server);

    // Send back the index.html file
    send_html_file_response(request, "index.html");

    // For now we are done... so lets shutdown...
    stop_web_server(server);

    return 0;
}