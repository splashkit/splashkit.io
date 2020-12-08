#include "splashkit.h"

int main()
{
    write_line("About to start the server...");

    // Start a web server - defaults to listening to port 8080
    web_server server = start_web_server();

    // For now we are done... so lets shutdown...
    stop_web_server(server);

    return 0;
}