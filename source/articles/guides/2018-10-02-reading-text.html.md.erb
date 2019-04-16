---

title: Reading Text
date: 2018-10-02 10:00 UTC
author: Andrew Cain and others
author_url:
tags: starter
summary: See how to read text from the user, both from command line and graphical applications.
  
related_funcs:
  - read_line

---

This article shows you how to get started reading text from the user. This includes reading text from the command line but also how to read text from within a graphical application.

### Reading Text from the Command Line

Reading text input from the user is straight forward for command line applications. In this context, <%= link_for_function("read_line") %> gives you the ability to read a line of text entered at the Terminal. This is a **blocking** function call, meaning it waits for the user to input the line before it returns. For command line applications this is fine, you want it to wait for the input.

The following code demonstrates the use of <%= link_for_function("read_line") %> in order to read in and display the user's name.

<%= snippet "step1", "articles/guides/starter/readtext/" %>

### Reading Text in Graphical Applications

Reading input from users in graphical applications is more complex, as blocking operations will cause the entire graphical interface to freeze. With a graphical application you need to keep redrawing, processing events, updating elements, and refreshing the screen. If you stop doing this to wait for user input, then any dynamic visuals will stop!

Let's see how to read input from the user using some example code. We can then talk through the different parts to understand how they come together to give you a dynamic application with user input.

<%= snippet "step2", "articles/guides/starter/readtext/" %>

In the above program we want to read in the user's name and store it in the `name` variable. To get started with this we need to open a window, and load a font to draw the text and input. There is also the standard event loop that is repeating the basic actions of checking user input and drawing the screen until the program is closed.

The logic for reading input starts with the call to <%= link_for_function("start_reading_text") %>. This tells SplashKit that you want it to collect text input by the user, and that you want it drawn into the passed in <%= link_for_type("rectangle") %> (in this case `rect`). SplashKit is now listening for input from, and collecting this text for you when you call <%= link_for_function("process_events") %>. 

SplashKit will continue reading text from the user until they hit the Escape or Enter key. You can check if text still begin reading by calling the <%= link_for_function("reading_text") %> function. In this example we use this to update the name. You can also end text input yourself using the <%= link_for_function("end_reading_text") %> function.

When the SplashKit is no longer reading text you can use <%= link_for_function("text_entry_cancelled") %> to check if the user cancelled (by hitting Escape) the input. To read the actual value entered you call <%= link_for_function("text_input") %>. This will return the value entered by the user. If they did cancel the input then this will be an empty string.

The key with graphical input will be to keep updating the data associated with the graphical elements. This will keep the screen updating as you collect the input from the user. For this you need to <%= link_for_function("start_reading_text") %>, then at some point collec the <%= link_for_function("text_input") %> and <%= link_for_function("end_reading_text") %>.