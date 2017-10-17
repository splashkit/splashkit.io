<meta name="guide-title" content="Awesome Input guide" />
<meta name="api-link-groups" content="input" />
<meta name="api-link-functions" content="DrawText, EndReadingText, ReadingText, StartReadingText, TextInput" />

# Building a blog using Splashkit

## Handling Input
The blog that we are going to build will have 3 items: a place to enter blog's title, a place to enter blog's content and a submit button.
1. In the main method, create a new window
    ```C#
    Window blogWindow = new Window("BlogWindow", 800, 600);
    ```
2. Create a new C# file, say, `Blog.cs`
3. In that, create properties to hold the X and Y location of title, content and submit rectangle.
    For eg. 
    ```C#
    private int TitleX
    {
        get
        {
            return 100;
        }
    }
    private int TitleY
    {
        get
        {
            return 40;
        }
    }
    ```
    
4. Create properties to hold the height and weight of title, content and submit rectangle.
5. Now, create a window variable
    ```C#
    private Window _BlogWindow;
    ```
6. Create the constructor of blog class
    ```C#
    public Blog(Window blogWindow)
    {
        _BlogWindow = blogWindow;
    }
    ```
7. Now, create methods to return the rectangle for title, content and submit.
    For eg.
    ```C#
    public Rectangle TitleRectangle()
    {
        Rectangle rectangle = new Rectangle();
        rectangle.X = TitleX;
        rectangle.Y = TitleY;
        rectangle.Width = TitleWidth;
        rectangle.Height = TitleHeight;
        return rectangle;
    }
    ```
8. Create properties to store the title and content of a post
    ```C#
    public string Title
    {
        get;
        set;
    }
    public string Content
    {
        get;
        set;
    }
    ```
9. Create methods to draw title, content, and submit and call these methods from another method, say, `Draw`
    For eg.
    ```C#
    private void DrawTitle()
    {
        _BlogWindow.DrawText("Title: ", Color.Red, SplashKit.FontNamed("Arial"), 20, 30, 40);
        SplashKit.FillRectangle(Color.White, TitleRectangle());
        SplashKit.DrawText(Title, Color.Black, TitleX, TitleY);
    }
    public void Draw()
    {        
        DrawTitle();
        DrawContent();
        DrawSubmit();
    }
    ```
10. Now, switch to main method in `Program.cs` and create a `Blog` object.
    ```C#
    Blog blog = new Blog(blogWindow);
    ```
11. Create `readingTitle` and `readingContent` variable to indicate whether we are reading anything.
    ```C#
    bool readingTitle = false;
    bool readingContent = false;
    ```
12. You want the `blogWindow` to loop while the window has not been closed. You can do this by using `CloseRequested` method of Splashkit.
    ```C#
    while (!blogWindow.CloseRequested)
    {}
    ```
13. Within the loop you will need to:
    1. Process Events
    2. Now add an if statement to detect the left click within the title rectangle, You can do this by Splashkit's `MouseClicked` and `PointInRectangle` method.
        ```C#
        if (SplashKit.MouseClicked(MouseButton.LeftButton) && SplashKit.PointInRectangle(SplashKit.MousePosition(), blog.TitleRectangle()))
    3. Within this if statement, call the `StartReadingText` method of Splashkit and change `readingTitle` variable to true.
        ```C#
        SplashKit.StartReadingText(blog.TitleRectangle(), "Enter Title");
        readingTitle = true;
        ```
    4. Repeat the same for Content.
        ```C#
        if (SplashKit.MouseClicked(MouseButton.LeftButton) && SplashKit.PointInRectangle(SplashKit.MousePosition(), blog.ContentRectangle()))
            {
                SplashKit.StartReadingText(blog.ContentRectangle(), "Enter Content");
                readingContent = true;
            }
        ```
    5. Now add an if statement to end the reading text if user presses the return key.
        ```C#
        if (SplashKit.KeyTyped(KeyCode.ReturnKey))
            {
                readingTitle = false;
                readingContent = false;
                SplashKit.EndReadingText();
            }
        ```
    6. Now clear the window and call the draw method in blog.
        ```C#
        blogWindow.Clear(Color.Aqua);
        blog.Draw();
        ```
    7. Now add an if statement to detect the text entered by the user.
        ```C#
        if (SplashKit.ReadingText() && readingTitle)
            {
                blog.Title = SplashKit.TextInput();
                Console.WriteLine(blog.Title);
            }
            if (SplashKit.ReadingText() && readingContent)
            {
                blog.Content = SplashKit.TextInput();
                Console.WriteLine(blog.Content);
            }
        ```
    8. Refresh the screen
14. Build and run your program.
15. It should open a window that accept the title and content of a post.
16. Just click on title rectangle to write title and then press ENTER. To write content, just click on the content rectangle and press ENTER when you are done.
To view the execution of the above program, goto https://www.youtube.com/watch?v=F0V3Y5Bb-Jg


** [Akshat Bajaj](https://github.com/AkshatBajaj), 2017**