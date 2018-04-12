---

title: Drawing simple filled rectangles
date: 2018-04-12 02:20 UTC
tags: graphics,window
author: Coddec
author_url: https://github.com/coddec/
summary: |
  This guide discusses how you can open a window to draw some simple
  rectangles in order to start playing around with graphics in SplashKit.
related_funcs:
  - create_window
  - fill_rectangle
  - refresh_screen
---
SplashKit's [Graphics library](/api/graphics) provides methods and procedures for working with
graphic objects in C#.

## SplashKit DrawCircle usage example

```csharp
using System;
using SplashKitSDK;

public class Program
{
    public static void Main()
    {
        //Create an Window object
        Window myWindow = new Window("Drawing simple filled rectangles", 800, 600);

        //Draw the rectangle, with parameter: Color, x, y, width, height
        SplashKit.FillRectangle(Color.Black, 100, 200, 200, 300);

        SplashKit.FillRectangle(Color.Red, 400, 300, 100, 10);

        //Refresh the window to show the circle
        myWindow.Refresh(60);

        //Delay the windows for 3s in order to see it
        SplashKit.Delay(3000);
    }
}
```

## Results
![Images of Drawing simpel filled rectangles](https://i.imgur.com/uKwPrUv.png)
