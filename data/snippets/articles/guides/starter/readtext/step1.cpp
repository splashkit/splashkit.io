#include "splashkit.h"

int main()
{
    string name;    // declare a variable to store the name
    string quest;   // and another to store a quest

    write("What is your name: ");   // prompt the user for input
    name = read_line();             // read user input

    // Read in another value
    write(name + " what is your quest?");
    quest = read_line();

    write_line(quest);
    return 0;
}