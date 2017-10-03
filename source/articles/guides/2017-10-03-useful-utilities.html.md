---

title: Useful Utilities
date: 2017-10-03 06:20 UTC
author: Jake Renzella
tags: utilities

---

SplashKit's [utilities library](/api/utilities) provides a range of useful functions that can assist you with converting, checking and manipulating common data types in your SplashKit program.

These functions are useful in many areas of programming.

* [Converting a string to a number](#convert-string-to-number)
  * [Usage scenario: converting user input to an integer](#convert-user-input-to-int)
* [Checking if a string is a number](#check-if-string-is-number)
  * [Usage scenario: accept user input as a number](#accept-user-input-as-number)
* [Manipulating strings](#manipulating-strings)

## Converting a string to a number
<hr id="convert-string-to-number">

SplashKit provides two useful functions for handling the conversion of a ```std::string``` to either an ```int``` or a ```double```.

```c++
#include "splashkit.h"
#include <string>

using namespace std;

int main()
{
  //Convert the string "2017" to an integer 2017
  string some_string = "2017";
  int some_number = convert_to_integer(some_string);

  write_line("The value of some_number is now:");
  write_line(some_number);

  //Convert the string "3.14159265358979" to a double ~3.141593
  string pi_string = "3.14159265358979";
  double pi = convert_to_double(pi_string);

  write_line("The value of pi is now:");
  write_line(pi);

  return 0;
}
```

### Usage scenario: converting user input to an integer
<hr id="convert-user-input-to-int">

Consider you want to write a program that accepts two numbers as input from a user, multiplies them, and outputs the result. One way to accomplish this is to use SplashKit's ```convert_to_integer``` function.

```c++
#include "splashkit.h"
#include <string>

using namespace std;

int main()
{
  //User input will initially be stored in these two strings.
  string snum_1, snum_2;

  //And then it will be converted and stored in these integers.
  int inum_1, inum_2, result;

  //Read user input
  write("Enter first number: ");
  snum_1 = read_line();
  write("Enter second number: ");
  snum_2 = read_line();

  //Convert user input to integers
  inum_1 = convert_to_integer(snum_1);
  inum_2 = convert_to_integer(snum_2);

  //Compute the result
  result = inum_1 * inum_2;

  //Output the results
  write(snum_1 + " multiplied by " + snum_2 + " equals ");
  write_line(result);

  return 0;
}
```

The same can be achieved for decimal numbers, simply by swapping ```convert_to_integer``` with ```convert_to_double```, and using the appropriate data types.

```c++
//...

//Don't use integers, instead use doubles
double inum_1, inum_2, result;

//...

inum_1 = convert_to_double(snum_1);
inum_2 = convert_to_double(snum_2);

//...
```

## Checking if a string is a number
<hr id="check-if-string-is-number">

Another helpful set of functions provided by SplashKit's utilities library is ```is_integer``` and ```is_number```.

Consider the following.

```c++
#include "splashkit.h"
#include <string>

using namespace std;

int main()
{
  string message_1 = "9781273";
  string message_2 = "23129739.13";
  string message_3 = "Hello world.";

  if ( is_integer(message_1) )
    write_line("Message 1 contains an integer!");

  if ( is_number(message_1) )
    write_line("Message 1 contains a number!");

  if ( not is_integer(message_2) )
    write_line("Message 2 is not an integer!");

  if ( is_number(message_2) )
    write_line("Message 2 contains a number!");

  if ( not is_integer(message_3) )
    write_line("Message 3 is not an integer!");

  if ( not is_number(message_3) )
    write_line("Message 3 is not a number!");

  return 0;
}
```

Its output is as follows.

```
Message 1 contains an integer!
Message 1 contains a number!
Message 2 is not an integer!
Message 2 contains a number!
Message 3 is not an integer!
Message 3 is not a number!
```

### Usage scenario: accept user input as a number
<hr id="accept-user-input-as-number">

SplashKit's ```is_integer``` and ```is_number``` functions can be used to validate user input, ensuring the user always enters a valid data type.

```c++
#include "splashkit.h"
#include <string>

using namespace std;

/**
 * Reads input from a user, only allowing whole numbers.
 * @prompt string     - The string to display to the user.
 * @return int
 */
int read_integer(string prompt)
{
  string buffer;

  //Continue requesting user input until a valid whole number is entered.
  while (1)
  {
    //Prompt the user with the message
    write(prompt);
    //Read the user input as a string.
    buffer = read_line();
    //If the user input is a valid whole number, leave the loop.
    if ( is_integer(buffer) )
      break;
    //If the user input was not a valid whole number, ask them to enter a whole number.
    write_line("Please enter a valid whole number.");
  }
  //Convert the user input to an integer before returning it.
  return convert_to_integer(buffer);
}

int main()
{
  int height;

  height = read_integer("Enter your height in centimetres: ");
  write("Your are ");
  write(height);
  write_line("CM tall!");

  return 0;
}
```

## Manipulating strings
<hr id="manipulating-strings">

In addition to the functionality provided by C++'s standard ```string``` library, SplashKit's utilities library provides some extra string manipulation functions that can assist you with manipulating ```std::string``` data.

```c++
#include "splashkit.h"
#include <string>

using namespace std;

int main()
{
  string name = "Richard";
  string location = "        Burwood";

  //Convert "Richard" to "RICHARD"
  name = to_uppercase(name);
  write_line(name);

  //Convert "RICHARD" to "richard"
  name = to_lowercase(name);
  write_line(name);

  //Remove all of the empty spaces at the start of "       Burwood".
  write_line("Before: " + location);
  location = trim(location);
  write_line("After: " + location);

  return 0;
}
```

