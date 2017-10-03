---

title: Using Databases
date: 2017-10-03 06:20 UTC
author: Jake Renzella
tags: databases

---

Databases are powerful tools for persisting, and querying data. In this guide, we'll be looking at SplashKit's SQLite3 database, and how to use it.

### Important types:
* `database` : The type which represents the actual database.
* `query_result`: This is the type which represents the result of performing an action on the database. If the action performed on the database returns data (such as a select sql statement), then it contains the returned data.

### How to use the database
1. Create or open a database.

    To open a database in SplashKit, you simply call:
   `open_database("test1", "test_database");`.

    The two required parameters are:
    * SplashKit's name of your database (important)
    * the name you wish to assign to the file of the database. (not as important).

      `open_database` returns a `database` type which you can then use to perform queries, so how do we actually open a database? Easy.

1. Create the variable which will hold the result/s of our queries for when we need it later:
  `query_result result;`

1. we're ready to run SQL statements! How exciting...
  `run_sql(my_db, "CREATE TABLE friends (id INTEGER PRIMARY KEY, name TEXT);");`
  This statement ran the sql statement provided to the given database, pretty simple! We can check if it was successful by using `query_success(result);` if we feel the need to.

1. Let's insert some data:
  `run_sql(my_db, "INSERT INTO friends VALUES (10001, \"Jake Renzella\";");`

1. And then let's query the database for the data which we just added (10001, Jake Renzella.)
  `result = run_sql(select * from friends;");`

  Notice that this query returns data (because it is a select statement), so we need to see what the data is, to do this, we assign the result of `run_sql` to our `result` variable.

1. Now we can inspect the data using `int data = query_column_for_int(result, 0);`

  this method looks at a query_result and checks what data is in the current row's given column. We expect our id of *10001* to be returned and stored in `data`.

Putting that together, here's a basic example of how to use a database:

```c
database my_db = open_database("jakes_database", "database_V0.3");
query_result result;

run_sql(my_db, "CREATE TABLE friends (id INTEGER PRIMARY KEY, name TEXT);");
run_sql(my_db, "INSERT INTO friends VALUES (10001, \"Jake Renzella\";");
//Of course we could have just executed this in one large SQL statement!
result = run_sql("select * from friends;");

//at this point (if all goes well), the data is added to the database, so let's read it.

int data = query_column_for_int(result, 0);

if (data == 10001)
{
  printf("WOOHOO");
}

///remember to clean up after yourself...
free_all_query_results();
free_database(my_db);
```

### Notes
* If multiple rows of data are returned from a statement, use `get_next_row(result);` to move to the next row, and perform your `query_column_for_X` method again.

  The usual pattern is to have a while loop performing `get_next_row(result)` and accessing the data in the body.

* You can natively store
    * ints
    * floats
    * text
    * bools (as ints.)

  and there are methods for all of these. See the API for more details.

* If needed, you can ask SplashKit what type of data is stored at a column using `query_type_of_col(result, 0)`.
We'll ask the database for you ;)

Jake Renzella, 2016.
