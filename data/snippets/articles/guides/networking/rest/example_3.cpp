#include "splashkit.h"
#include <string.h>

using namespace std;

int main()
{
    http_response get_data;
    string response;

    // Create a JSON Web resource
    // Create the JSON body for the http post call
    json body = create_json();
    json_set_string(body, "title", "foo");
    json_set_string(body, "body", "test entry");
    json_set_number(body, "userId", 1);
    // Create the header for the http post call
    vector<string> headers;
    headers.push_back("Content-type: application/json; charset=UTF-8");
    // Send the request
    get_data = http_post("https://jsonplaceholder.typicode.com/posts", 443, json_to_string(body), headers);
    response = http_response_to_string(get_data);
    free_response(get_data);
    // Output the response
    json json_response = json_from_string(response);
    write_line("Following resource has been created");
    write_line("UserID => " + to_string(json_read_number_as_int(json_response, "userId")));
    write_line("ID     => " + to_string(json_read_number_as_int(json_response, "id")));
    write_line("Title  => " + json_read_string(json_response, "title"));
    write_line("Body   => " + json_read_string(json_response, "body"));
    write_line("================");

    return 0;
}