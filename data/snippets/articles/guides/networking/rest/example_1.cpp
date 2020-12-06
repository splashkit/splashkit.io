#include "splashkit.h"
#include <string.h>

using namespace std;

int main()
{
    http_response get_data;
    string response;

    // Get a single JSON web resource
    get_data = http_get("https://jsonplaceholder.typicode.com/posts/1", 443);
    response = http_response_to_string(get_data);
    free_response(get_data);
    // Output the response
    json json_response = json_from_string(response);
    write_line("UserID => " + to_string(json_read_number_as_int(json_response, "userId")));
    write_line("ID     => " + to_string(json_read_number_as_int(json_response, "id")));
    write_line("Title  => " + json_read_string(json_response, "title"));
    write_line("Body   => " + json_read_string(json_response, "body"));
    write_line("================");

    return 0;
}