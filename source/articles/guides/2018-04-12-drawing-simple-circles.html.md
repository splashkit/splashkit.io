---

title: Drawing simple circles
date: 2018-04-12 01:18 UTC
tags: graphics,window
author: Coddec
author_url: https://github.com/coddec/
summary: |
  This guide discusses how you can open a window to draw some simple
  circles in order to start playing around with graphics in SplashKit.
related_funcs:
  - create_window
  - draw_circle
  - refresh_screen

---

SplashKit's [Graphics library](/api/graphics) provides methods and procedures for working with
JSON objects in C#.

## SplashKit DrawCircle usage example

```csharp
using System;
using SplashKitSDK;

public class Program
{
    public static void Main()
    {
        //Create an Window object
        Window myWindow = new Window("Draw simple circles", 800, 600);

        //Draw the circle, with parameter: Color, x, y, radius
        SplashKit.DrawCircle(Color.Black, 100, 100, 50);

        SplashKit.DrawCircle(Color.Black, 200, 300, 50);

        //Refresh the window to show the circle
        myWindow.Refresh(60);

        //Delay the windows for 3s in order to see it
        SplashKit.Delay(3000);
    }
}
```

## Results
![Images of Drawing simpel circles](https://i.imgur.com/RHTRMFx.png)

