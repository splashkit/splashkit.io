#include "splashkit.h"

int main()
{
	web_server webServer = start_web_server(8080);
	http_request newRequest;

	while(true){
		//Get the next request that the server has
		newRequest = next_web_request(webServer);
		if(is_http_request_for("login")){
			//Serve page for login path
			send_html_file_response(newRequest, "login.html");
		}else if(is_http_request_for("contact")){
			//Serve page for contact path
			send_html_file_response(newRequest, "contact.html");
		}else if(is_http_request_for("about")){
			//Server page for about path
			send_html_file_response(newRequest, "about.html");
		}else{
			//If no specified path is requested, serve index.html to the user
			send_html_file_response(newRequest, "index.html");
		}
	}
	stop_web_server(webServer);

	return 0;
}