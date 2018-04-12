---

title: Drawing simple rectangles
date: 2018-04-12 02:09 UTC
tags: graphics,window
author: Coddec
author_url: https://github.com/coddec/
summary: |
  This guide discusses how you can open a window to draw some simple
  rectangles in order to start playing around with graphics in SplashKit.
related_funcs:
  - create_window
  - draw_rectangle
  - refresh_screen
---

SplashKit's [Graphics library](/api/graphics) provides methods and procedures for working with
graphic objects in C#.

## SplashKit DrawRectangle usage example

```csharp
using System;
using SplashKitSDK;

public class Program
{
    public static void Main()
    {
        //Create an Window object
        Window myWindow = new Window("Drawing simple rectangles", 800, 600);

        //Draw the rectangle, with parameter: Color, x, y, width, height
        SplashKit.DrawRectangle(Color.Black, 100, 200, 200, 300);

        SplashKit.DrawRectangle(Color.Red, 400, 300, 100, 10);

        //Refresh the window to show the circle
        myWindow.Refresh(60);

        //Delay the windows for 3s in order to see it
        SplashKit.Delay(3000);
    }
}
```

## Results
![Images of Drawing simpel rectangles](https://i.imgur.com/wr4GlP4.png)
