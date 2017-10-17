<meta name="guide-title" content="Awesome Database guide" />
<meta name="api-link-groups" content="input" />
<meta name="api-link-functions" content="OpenDatabase, HasDatabase, RunSql, QueryColumnForString, FreeAllQueryResults, FreeDatabase" />

# Building a blog using Splashkit
## Database Connectivity
We have a window (https://github.com/splashkit/splashkit.io/pull/8) that accepts the title and content of a post, but what happens when you click on the submit button, pretty much nothing, as we do not have a database to store the contents entered by the user. We can use the SplashKit’s built in `SQLite3` database for persisting, and querying data.
Important types:
* `database` : The type which represents the actual database.
* `query_result` : This is the type which represents the result of performing an action on the database. If the action performed on the database returns data (such as a select sql statement), then it contains the returned data.
To store the title and content entered by the user:
1. Create a new C# file, say, `ManageDatabase.cs`
2. In the `ManageDatabase` class, create variables to refer to the database and to store the result of the query.
    ```C#
    private Database blogEntries;
    QueryResult queryResult;
    ```
    
3. Declare the constructor of `ManageDatabase` class which opens a database and creates a table to store the title and content of the post.
    ```C#
    public ManageDatabase()
    {
    blogEntries = SplashKit.OpenDatabase("BlogEntriesDatabase", "Database");
    Console.WriteLine("Has Database: " + SplashKit.HasDatabase("BlogEntriesDatabase"));
    queryResult = SplashKit.RunSql(blogEntries, "CREATE TABLE if not exists blog (title TEXT PRIMARY KEY, content TEXT);");
    Console.WriteLine("Creating table: " + SplashKit.QuerySuccess(queryResult));
    }
    ```
4. Now, declare a method to handle the submit call from user.
    ```C#
    public void Submit(Blog blog)
    {}
    ```
5. In this method, run a SQL query to store the title and content of the post.
    ```C#
    queryResult = SplashKit.RunSql(blogEntries, $"INSERT INTO blog VALUES ('{blog.Title}','{blog.Content}');");
    Console.WriteLine("Inserting " + SplashKit.QuerySuccess(queryResult));
    ```

6. Again, run a SQL query to query the database for the data which we just added.
    ```C#
    queryResult = SplashKit.RunSql(blogEntries, "select * from blog;");
    Console.WriteLine("Selecting " + SplashKit.QuerySuccess(queryResult));
    ```
        
7. Now, to see the data returned by the select statement, use Splashkit's `QueryColumnForString` method.
8. If multiple rows of data are returned from the statement, use Splashkit's `GetNextRow method` to move to the next row, and perform your `QueryColumnForString` method again.
    ```C#
    do
        {
            string data = SplashKit.QueryColumnForString(queryResult, 1);
            Console.WriteLine(data);            
        } while (SplashKit.GetNextRow(queryResult));
    ```
        
9. It is a good practice to free query results and database, you can do this with the help of Splashkit's `FreeAllQueryResults` and `FreeDatabase` method.
    ```C#
    SplashKit.FreeAllQueryResults();
    SplashKit.FreeDatabase(blogEntries);
    ```

10. Now switch to main method in Program.cs, and declare an object of ManageDatabase
    ```C#
    ManageDatabase manageDatabase = new ManageDatabase();
    ```
11. Inside the `blogWindow.CloseRequested` loop, add an if statement to detect the left click on submit button.
    ```C#
    if (SplashKit.MouseClicked(MouseButton.LeftButton) && SplashKit.PointInRectangle(SplashKit.MousePosition(), blog.SubmitRectangle()))
            {
                manageDatabase.Submit(blog);
            }
    ```
12. Now, you have a database that can store the title and content of a post.
13. Build and run your program.
14. It will open a window that accepts title and content of a  post. Just click on title rectangle to write title and then press ENTER. To write content, just click on the content rectangle and press ENTER when you are done. Now, when you click on submit button the Splashkit will store the title and content in the database. You can view the data stored in the database in the console.
To view the execution of the above program, goto https://www.youtube.com/watch?v=F0V3Y5Bb-Jg


** [Akshat Bajaj](https://github.com/AkshatBajaj), 2017**