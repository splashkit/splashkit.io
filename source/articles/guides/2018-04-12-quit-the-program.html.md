---

title: Quit the program
date: 2018-04-12 02:31 UTC
tags: input,window
author: Coddec
author_url: https://github.com/coddec/
summary: |
  This guide discusses how you can open a window and use SplashKit.QuitRequested()
  to quit the program.
related_funcs:
  - create_window
  - quit_requested
  - refresh_screen
  - clear_screen
  - process_events
  - delay
---

SplashKit's [Input library](/api/input) provides methods and procedures for working with
input methods in C#.

## SplashKit QuitRequested usage example

```csharp
using System;
using SplashKitSDK;

public class Program
{
    public static void Main()
    {
        //Create an Window object
        Window myWindow = new Window("Quit the program", 800, 600);

        //If exit is not requested
        while (!SplashKit.QuitRequested())
        {
            //Without ProcessEvents, the window will not respond thus won't quit
            SplashKit.ProcessEvents();

            //Change color of the window every 1s
            myWindow.Clear(Color.RandomRGB(200));
            SplashKit.Delay(1000);

            
            myWindow.Refresh(60);
        }
    }
}
```

