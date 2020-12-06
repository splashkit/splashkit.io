#include "splashkit.h"

int main()
{
	web_server webServer = start_web_server(8080);
	http_request newRequest = next_web_request(webServer);

	send_html_file_response(newRequest, "index.html");
	stop_web_server(webServer);

	return 0;
}