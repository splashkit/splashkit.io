---

title: Getting Started Drawing using Procedures
date: 2018-05-30 10:00 UTC
author: Andrew Cain
author_url:
tags: starter
summary: |
  This article provide a quick overview of getting started with SplashKit. It includes how to 
  create a window and do some basic drawing in order to create a small animation. This is a 
  great place to start with SplashKit.
related_funcs:
  - open_window
  - delay
  - clear_screen
  - fill_ellipse
  - fill_rectangle
  - fill_triangle
  - refresh_screen
  - draw_bitmap

---

In this article you will see how to get started with SplashKit with some simple drawing operations. Once you have this working you will be able to start exploring the different features you can work with.

## Step 1: Creating a Window

In SplashKit you can open a Window to draw on and interact with. To open the window you need to call [open_window](/api/graphics/#open-window). This procedure requires you to pass it the window’s title, width and height. For example  `open_window("House Drawing", 800, 600);` will open a window that is 800 pixels wide and 600 pixels high with the title "House Drawing", as shown in the following image. Please note that the house and hill are drawn by additional code.

<img alt="Window with dimensions illustrated" src="/images/articles/starter/drawing/NewWindow.png" style="width: 700px"></img>

1. Lets get this started by opening a new Window, and using SplashKit to delay us for a few seconds. Give the following code a try:

<%= snippet "step1", "articles/guides/starter/drawing/" %>

1. Compile and run the program from the terminal.

    For example in C++ you would use:

    ~~~bash
    skm clang++ program.cpp -o ShapeDrawing
    ./ShapeDrawing
    ~~~

    You should see the window open, and the program delay for 5 seconds.

1. Change the window title to "Shapes by " and your name. For example, `"Shapes by Andrew"`.

    Switch back to the terminal to compile and run your program.


## Step 2: Drawing to a Window

1. Adjust `main` so that it now draws the house shown above.

<%= snippet "step2", "articles/guides/starter/drawing/" %>

1. Build and run the program.

    For example in C++ you would use:

    ~~~bash
    skm clang++ program.cpp -o ShapeDrawing
    ./ShapeDrawing
    ~~~

    Make sure it all looks correct before moving on.

## Pixels and Coordinates

The images you see on your computer’s screen are made up of dots called pixels: picture elements. The screen has many pixels arranged into a grid (columns and rows), with each pixel having its own color and unique location (a combination of an `x` and `y` value, where `x` indicates the column and `y` the row).

The following image shows an example of two rectangles (one filled, one outlined). The top left corner of the screen is at row (x) 0 and column (y) 0, and these numbers increase as you go to the right and down the screen. The call to `fill_rectangle` and `draw_rectangle` take in a color, a `x` value, a `y` value, and a `width` and a `height`. So the blue rectangle is filled at x 1, y 1, is 7 pixels wide, and 3 pixels high.

<img alt="Pixel locations are based on x and y locations." src="/images/articles/starter/drawing/DrawFill.png" style="width: 700px"></img>

Positions on the screen are determined using two values, one for x and the other for y. The x value determines the number of pixels from the left side of the screen. The y value determines the number of pixels from the top of the screen.

For example: the magenta rectangle is drawn at 10, 1. This means its x value is 10 and its y is 1. This rectangle is drawn 10 pixels from the left of the screen, and its 1 pixel from the top.

## Drawing Procedures

To draw a shape with SplashKit you need to call one of the shape drawing procedures. All of the shape drawing operations in SplashKit take a number of parameter values:

* The **color** to draw the shape. 
    SplashKit has a number of colors you can use. See the list of colors starting with (Alice Blue)[/api/color#color-alice-blue]. For example, in C++ the colors are written as `COLOR_WHITE`, `COLOR_GREEN`, `COLOR_BLUE`, `COLOR_BLACK`, `COLOR_RED`, and many others. VS Code should show you a list once you type `COLOR_` then hit ctrl+space. Though this only works if you opened the project folder.
* An **x** value, representing the x position of the shape (column). 
    
    This is a number of pixels from the left edge of the screen. Larger values are further to the right.
* A **y** value, representing the y position of the shape (row). 
    
    This is a number of pixels from the top edge of the screen. Larger values are further down the screen.
* and other values for the size of the shape, these will differ depending on the kind of shape being drawn (e.g., rectangle has a width and height, as does ellipse, circles would have a radius).

See the following for examples of what you can call:

* [Clear Screen](/api/graphics#clear_screen)
* [Draw Circle](/api/graphics#draw_circle)
* [Fill Circle](/api/graphics#fill_circle)
* [Draw Rectangle](/api/graphics#draw_rectangle)
* [Fill Rectangle](/api/graphics#fill_rectangle)
* [Draw Triangle](/api/graphics#draw_triangle)
* [Fill Triangle](/api/graphics#fill_triangle)
* [Draw Ellipse](/api/graphics#draw_ellipse)
* [Fill Ellipse](/api/graphics#fill_ellipse)
* [Draw Line](/api/graphics#draw_line)

## Autocomplete

You should be able to get Visual Studio Code to show you to list of parameters. Type the start of the procedure name then press `ctrl-space`. There are usually a couple of different ways to draw each shape, by pressing the up down arrows you should be able to explore this list. An example with C++ is shown below.

<img alt="Use `ctrl-space` to bring up the autocomplete for procedures you want to call." src="/images/articles/starter/drawing/AutoComplete.png" style="width: 700px"></img>

## Double Buffering

To draw a picture, like the house shown above, the computer executes the code to draw the individual shapes one at a time in the order they appear in the code (in **sequence**).  However, we don't want each element to appear individually, we just want the whole picture to appear at once, so in this case the whole house should show all at once. SplashKit uses a technique called **Double Buffering** to enable this. When double buffering, the computer first draws the shapes, then waits for a command to display the shapes to the user.  With SplashKit, the shapes are all shown together when you call the `refresh_screen` procedure. This is illustrated below.

<img alt="Illustration of double buffering, and the need to refresh screen" src="/images/articles/starter/drawing/RefreshScreen.png" style="width: 700px"></img>

