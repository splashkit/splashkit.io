<meta name="guide-title" content="Keeping track of your windows in SplashKit" />
<meta name="api-link-groups" content="windows" />
<meta name="api-link-functions" content="set_current_window,open_window,resize_window,window_named" />

#Keeping track of your windows in SplashKit

SplashKit [Windows library](/api/windows) provides a [```window```](/api/windows/#window) data type that refers to your open windows.

The ability to identify each individual window is fundamental to the management of applications that require multiply window.

SplashKit gives us the [```open_window(string caption, int x, int y)```](/api/windows/#window_open) function to open a new graphic window.

We have two options to identify a window;

* We can refer to the the caption parameter that we passed into the [```open_window(string caption, int x, int y)```](/api/windows/#window_open) function. Then we can use function that are in the form [```set_current_window(const string &name)```](/api/windows/#set_current_window_named).
* Or we can refere to a variable that we assign the window returned when we call the [```open_window(string caption, int x, int y)```](/api/windows/#window_open). Then we can use functions that are in the form [```set_current_window(window wind)```](/api/windows/#set_current_window).

### Example code

```c++
#include "splashkit.h"

int main()
{
    int window_width = 500;
    int window_height = 500;

    //Option 1
    //Open a Window
    open_window("Window A",window_width,window_height);
    
    //Set to current window by name 
    set_current_window("Window A");
    
    //Options 2 
    //Initialise a window variable
    window window_b;
    //Assign the window to a variable 
    window_b = open_window("Window B",window_width,window_height);
 
    //Set to current window unsing the window variable
    set_current_window(window_b);
    
    //or
    
    //We can still set to current window by name
    set_current_window("Window B");

```
## From named window to window type
 
Some functions e.g. [```resize_window(window wind)```](/api/windows/#resize_window) do not have a verison that allows us to direcrtly reference a window by its caption. We can use the [```window_named(string caption)```](/api/windows/#window_named) function to return a window by passing in a caption.

### Example code

```c++
    //Initialise a window variable
    window window_a;
    //Assign the window to a variable 
    window_a = window_named("Window A");
    resize_window(window_a, int width, int height);
    
    //or

    //in one step 
    resize_window(window_named("Window A"), int width, int height);
}
```
