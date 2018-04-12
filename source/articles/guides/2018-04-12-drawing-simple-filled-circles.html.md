---

title: Drawing simple filled circles
date: 2018-04-12 01:54 UTC
tags: graphics,window
author: Coddec
author_url: https://github.com/coddec/
summary: |
  This guide discusses how you can open a window to draw some simple
  filled circles in order to start playing around with graphics in SplashKit.
related_funcs:
  - create_window
  - fill_circle
  - refresh_screen
---

SplashKit's [Graphics library](/api/graphics) provides methods and procedures for working with
graphic objects in C#.

## SplashKit FillCircle usage example

```csharp
using System;
using SplashKitSDK;

public class Program
{
    public static void Main()
    {
        //Create an Window object
        Window myWindow = new Window("Drawing simple filled circles", 800, 600);

        //Draw the circle, with parameter: Color, x, y, radius
        SplashKit.FillCircle(Color.Black, 200, 100, 50);

        SplashKit.FillCircle(Color.Red, 400, 300, 100);

        //Refresh the window to show the circle
        myWindow.Refresh(60);

        //Delay the windows for 3s in order to see it
        SplashKit.Delay(3000);
    }
}
```

## Results

![Images of Drawing simpel filled circles](https://i.imgur.com/eJKxsj1.png)
