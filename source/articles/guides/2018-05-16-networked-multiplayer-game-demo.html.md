---

title: Guide to create a simple multiplayer networked game with SplashKit
date: 2018-05-16 20:59 UTC
tags: graphics,window,network
author: Coddec
author_url: https://github.com/coddec/
summary: |
  This guide discusses how you can create a simple multiplyer networked game
  with SplashKit.
related_funcs:
  - create_window
  - fill_circle
  - refresh_screen
  - process_events
  - fill_circle
  - circle_at
  - random_rgb_color
  - draw_text
  - key_released
  - circles_intersect
  - has_new_connections
  - accept_all_new_connections
  - check_network_activity
  - read_message_data
  - fetch_new_connection
  - broadcast_message
  - has_messages
  - close_all_connections
---

SplashKit's [Home Page](http://www.splashkit.io/) provides methods and procedures for working with
variety of objects in C#.


## Use SplashKit to create a simple multiplayer networked game

---
## Table of Contents
- ***[0. Pre-Guide](#0-pre-guide)***
	- [0.1 Background](#01-background)
	- [0.2 Class Diagram](#02-class-diagram)
- ***[1. Player.cs](#1-playercs)***
	- [1.1 Define required variables, fields and properties.](#11-define-required-variables-fields-and-properties)
	- [1.2 Create class constructor](#12-create-class-constructor)
	- [1.3 Create the rest of the class](#13-create-the-rest-of-the-class)
- ***[2. OtherPlayer.cs](#2-otherplayercs)***
	- [2.1 Define required variables, fields and properties.](#21-define-required-variables-fields-and-properties)
	- [2.2 Create class constructor](#22-create-class-constructor)
	- [2.3 Create the rest of the class](#23-create-the-rest-of-the-class)
- ***[3. Network.cs](#3-networkcs)***
	- [3.1 Define required variables, fields and properties.](#31-define-required-variables-fields-and-properties)
	- [3.2 Create class constructor](#32-create-class-constructor)
	- [3.3 Create the rest of the class](#33-create-the-rest-of-the-class)
- ***[4. Game.cs](#4-gamecs)***
	- [4.1 Define required variables, fields and properties.](#41-define-required-variables-fields-and-properties)
	- [4.2 Create class constructor](#42-create-class-constructor)
	- [4.3 Create the rest of the class](#43-create-the-rest-of-the-class)
- ***[5. Program.cs](#5-programcs)***
---


### 0. Pre-Guide
#### Before writing the code, some installation need to be done
[SplashKit Instllation](http://www.splashkit.io/articles/installation/)

#### 0.1 Background
This article will guide you to create a very simple networked multiplayer game.

Once started, the game will first ask player's name, online or offline game.

If selected offline game, the game will start straight way.

If selected online game, the game will ask some network related questions in order to start an online game.


#### 0.2 Class Diagram
![Class Diagram](https://raw.githubusercontent.com/coddec/NetworkedMultiplayerDemo/master/UMLV2.jpg)


### 1. Player.cs
#### This class defines everything a player object can do and know.
- This public class named `Player`

##### 1.1 Define required variables, fields and properties.
- The player will have X, Y coordinates so that it can be drew on the game window.
We create property X and Y.

```csharp
public double X { get; private set; }
```
- Create a `Y` property in similar way with `X` in above example.
- The player will have a `Name` property as `string` type.
- The Player will have a `Radius` property assgined as `double` type with default value of `10`.

```csharp
public double Radius { get; set; } = 10;
```
- A private `Circle` variable `c` will be created for collision detection purpose.
- The player will have a private `Color` stored in `PlayerColor`.
- The player can move around the screen, we give it a `Speed` in form of integer, with default speed of `5` with private modifier.
- The player will have a public `Quit` property in form of `boolean`, so that player can exit the game on wish.

##### 1.2 Create class constructor
- The player need to know where to draw itself and its name, so we should pass `Window gameWidow` and `string name` in constructor.
- Within the constructor, we assign X and Y points for player to draw on, and its name and color.
	- We want to put player object in the center of the gamewindow by using `X = gameWindow.Width / 2;` to make the player appear at the center horizontally.
	- Set Y equal to half of the height of the gamewindow, now the player shoule be draw at the center of the gamewindow intially, when game started.
	- Set the Name property to equal passed in name variable
	- We assign a random color to player's color property by using `PlayerColor = SplashKit.RandomRGBColor(200);`


##### 1.3 Create the rest of the class
- The player will have a `Draw()` method, so that it can draw it self when called
- This method will draw the player as a filled circle, a circle for collision detection and its name.
- It will include:
	- Draw a solid circle with passed in PlayerColor, X, Y and Radius parameter `SplashKit.FillCircle(PlayerColor, X, Y, Radius);`
	- Draw a invisible circle around the solid circle for collision detection purpose `c = SplashKit.CircleAt(X, Y, Radius);`
	- Finally we need to draw the player's name on top of it `SplashKit.DrawText(Name, Color.Black, X - Radius, Y - Radius - 10);`
	- These will make up our Draw() method for player class

- The player will have a HandleInput method, so that it can respond to keyboard stroke, in this game the player object can bed moved around by changing its X and Y, and exit the game by pressing ESC key.
- To achieve it we need to create a couple of if statements.
	- When user pressed ESC key, we will set Quit property to true, by using `SplashKit.KeyDown(SplashKitSDK.KeyCode.EscapeKey)` with if statements we will be able to achieve this.
	- With similar structure, we can move the player to desired direction with keys we like e.g. WSAD to change its X and Y with out defined Speed variable.

- The player will return true if it collided with other player, in order to know which otherplayer it collided with, we need to pass in otherplayer to this method.

```csharp
    public bool CollidedWithPlayer(OtherPlayer op)
    {
        //To return the status of collision we use `CirclesIntersect` from SplashKit
        return SplashKit.CirclesIntersect(c, op.CollisionCircle);
    }
```

### 2. OtherPlayer.cs
#### This class defines everything a OtherPlayer object can do and know. This class is used to show the other player over the network on our game window.
- This public class named `OtherPlayer`

##### 2.1 Define required variables, fields and properties.
- The OtherPlayer will have similar structure with Player class but significantly less code.
- It has public `Name`, `X`, `Y`, `Radius` and private `PlayerColor` properties.
- The OtherPlayer will have a public `CollisionCircle` getter property to return it's collision circle. So that we can use this information to decide the collision between player and otherplayer within the game.

```csharp
    public Circle CollisionCircle
    {
        get
        {
            return SplashKit.CircleAt(X, Y, Radius);
        }
    }
```

##### 2.2 Create class constructor
- In order to draw OtherPlayer on the screen later, we need to pass in ` string name`, ` double x`, `double y`, `double radius` in the constructor to start with and set properties from constructor.
  - Within the constructor, we will set the corresponding properties equal to passed in value
  - We also set the PlayerColor to gray within the constructor `PlayerColor = SplashKit.ColorGray();`


##### 2.3 Create the rest of the class
- The OhterPlayer will have `Draw()` method, which will draw a filled circle and name on top of it similar with Player class without worring about `CircleAt` as in Player class, because we have defined `CollisionCircle` previously.


### 3. Network.cs
#### This class defines everything related to nerwork part that we need to use later in the game, based on [Andrew](https://github.com/macite)'s Chat program example
- This public class named `GamePeer`

##### 3.1 Define required variables, fields and properties.
- A public `Name` property
- A private `_server` field to store server port as `ServerSocket`
- A private `_peers` field to store `Dictionary<string, Connection>`
- A public `GetMsg` property with private set that will be used later for returning message from broadcast as string
- A public `Server` property will return `_server` field as `ServerSocket` just in case if we need server informationin other classes.

##### 3.2 Create class constructor
- The constructor will simply assign _server a name and a port parameter via passed in `port` as `ushort`

```csharp
    public GamePeer(ushort port)
    {
        //This will create a server to listen on incoming port which specified by user passed in with port parameter
        _server = new ServerSocket("GameServer", port);
    }
```

##### 3.3 Create the rest of the class
- The `ConnectToGamePeer` will be passed in address as ip address and port as ushort to connect to.

```csharp
//To make a new connection to host server
    public void ConnectToGamePeer(string address, ushort port)
    {
        // We create a new connection based on port and ip address specified by user (passed in as parameter)
        Connection newConnection = new Connection($"{address }:{port}", address, port);
        //If the connection is successfully opened, we print a confirmation message to acknowledge user in console
        if (newConnection.IsOpen)
        {
            Console.WriteLine($"Conected to {address}:{port}");
        }
    }
```

- We need to create a method to `EstablishConnection` which will take `Connection` type as parameter

```csharp
private void EstablishConnection(Connection con)
    {
        // Send my name...
        con.SendMessage(Name);

        // Wait for a message...
        SplashKit.CheckNetworkActivity();
        //To prevent missing the message we detect 10 times instead of once
        for (int i = 0; i < 10 && !con.HasMessages; i++)
        {
            SplashKit.CheckNetworkActivity();
        }

        //If there's still no message, we close the connection and throw the exception
        if (!con.HasMessages)
        {
            con.Close();
            throw new Exception("Timeout waiting for name of peer");
        }

        // Read the name
        string name = con.ReadMessageData();

        // See if we can register this...
        //If we found same name within our dictionary, we reject the new connection duplicate name, and close it then throw exception
        if (_peers.ContainsKey(name))
        {
            con.Close();
            throw new Exception("Unable to connect to multiple peers with the same name");
        }

        // Register
        //Otherwise we register the connection
        _peers[name] = con;
        Console.WriteLine($"Connected to {name} at { SplashKit.Ipv4ToStr(con.IP) }:{con.Port}");
    }
```

- In order to send message, we create a method called `Broadcast` which will be passed in message as string, within the method we use `SplashKit.BroadcastMessage(PassedInMessage)` to broadcast message passed to this method.
- Next we create a `GetNewMessage` method to receive and return the message from network.

```csharp
    public string GetNewMessages()
    {
        //First we need to check if there is network activity
        SplashKit.CheckNetworkActivity();

        //While SplashKit detects new message, we extract message from SplashKit.ReadMessage()
        //Then pass the message to GetMsg property for external classed to use, we also return the received message
        while (SplashKit.HasMessages())
        {
            using (Message m = SplashKit.ReadMessage())
            {
                GetMsg = m.Data;
            }
        }
        return GetMsg;
    }
```

- To close the connection properly we can use following code in a `Close()` method

```csharp
_server.Close(); //Close the current server's connections
SplashKit.CloseAllConnections(); //Use SplashKit to further make sure we close all connections
```


### 4. Game.cs
#### This class handles the logic of the whole game
- This public class named `Game`

##### 4.1 Define required variables, fields and properties.
- Create private `_Player` field as `Player` to store player objecte we use in the game
- Create public `OnlineGame` and `IsServer` as boolean peoperty with private set, so that later we can act dependently
- Create public `ThisPeer` as `GamePeer` network object, so that later we can broadcast and receive message via network
- Create private `_otherPlayerMsg` field for storing message we get from other player over network
- Create private `_otherPlayers` as list with type of OtherPlayer and `_otherNetworkNames` as list with type of string to store otherPlayer object and name of otherPlayer we received over network
- Create private  `name` as string, `x`, `y`, `radius` as double to store information for otherPlayer.
- Create `Quit` property to return the status from player class `_player.Quit` with getter


##### 4.2 Create class constructor
- The constructor will be passed in a Window parameter, so that it knows where to draw everything
	- Once started, the constructor will ask player's name and store in a temporary string variable for local use to do this we can use following code

 ```csharp
Console.Write("What is your name: "); //Print question on console 
string name = Console.ReadLine(); //Store input from user to name variable
 ```

 - Next we ask user, and use if else if block, if it's online game we set `OnlineGame` to false
 - If not, we set `OnlineGame` to true, then ask user which port to run at, the anwser should be converted with `Convert.ToUInt16()` then we store it in `port` ushort variable
 - Next we create the network object and set our network name with `GamePeer peer = new GamePeer(port) { Name = name };` and set `ThisPeer` property equal to `peer` we've created.
 - Next we use same technique to ask user if this is host server or not
	- If this is host we set `IsServer` to true
	- If this is not host or server which means it is a client, we set `IsServer` to false and use `MakeNewConnection(peer)` method to connect to server (We will create this method later)
 - After setup, we create the player with passed in Window parameter and name we got from user input.
 - Then we set the _player property to refer to the player we just created


##### 4.3 Create the rest of the class
- `HandleInput()` will call indentical method in player class on _player property
- `Draw()` will call indentical method in player class on _player property and also draw each otherPlayer from otherPlayers list if this list contains 1 or more otherPlayer

```csharp
//Code for drawing each OtherPlayer part
if (_otherPlayers.Count > 0) //If _otherPlayers list contain 1 or more otherPlayer
{
      foreach (OtherPlayer op in _otherPlayers) //Loop over each otherPlayer and draw them
      {
           op.Draw();
      }
}
```

- `Update()` method will call `CheckCollisions()` method to see if two players collided and also call `UpdateNetworkInfo()` and `UpdateOtherPlayerInfo()` methods if `OnlineGame` is set to true
- `CheckCollisions()` method will loop over each `_otherPlayers` to see if player collised with otherPlayer and print message to indicate collision

```csharp
private void CheckCollisions()
{
    foreach (OtherPlayer op in _otherPlayers) //Loop over each otherPlayer within _otherPlayers list
    {
        if (_player.CollidedWithPlayer(op)) //If _player collided with OtherPlayer, output message
        {
            Console.WriteLine("Collided at "+ DateTime.Now);
        }
    }
}
```

- Next we will create network and otherPlayer related parts
- `UpdateNetworkInfo()` method will store message we get from other player
	- If it is server it will continuously accept incoming connections by using `SplashKit.AcceptAllNewConnections();`
	- It will always store received message to local property `_otherPlayerMsg = ThisPeer.GetNewMessages();`
	- It will call `UpdateOtherPlayer();` method to update information for otherPlayer 
	- IT will broadcast the current player's status by using `BroadcastMessage();` method


- `UpdateOtherPlayer()` method will process incoming message if the message length is greater than 0, we split the string into pieces by comma, we use Split method from C#, `name = _otherPlayerMsg.Split(',')[0];`,`x = Convert.ToDouble(_otherPlayerMsg.Split(',')[1]);`, then if the length of name is greater than 0 and not exist in the `_otherNetworkNames` we add the otherPlayer to the otherPlayers list

```csharp
public void UpdateOtherPlayer()
{
	//If the message exists and length is greater than 0, means we really have a message
    if (_otherPlayerMsg != null && _otherPlayerMsg.Length > 0)
    {
		//We separate the string to pieces for later use 
        name = _otherPlayerMsg.Split(',')[0];
        x = Convert.ToDouble(_otherPlayerMsg.Split(',')[1]);
        y = Convert.ToDouble(_otherPlayerMsg.Split(',')[2]);
        radius = Convert.ToDouble(_otherPlayerMsg.Split(',')[3]);
    }
    if (name.Length > 0) //If length of name is greater than, we check if the name does not exist in our list then we add it to our list and create the otherPlayer object
    {
        if (!_otherNetworkNames.Contains(name))
        {
            _otherNetworkNames.Add(name);
            _otherPlayers.Add(new OtherPlayer(name, x, y, radius));
        }
    }
}
```

- After the otherPlayer has been added, we need to update its information depend on received information, so it moves on our screen as it does on the other player's screen, for each otherPlayer we update their X, Y and radius in `UpdateOtherPlayerInfo()` method
- We create a `BroadcastMessage()` which will broadcast current player's name, X, Y, and radius.

```csharp
ThisPeer.Broadcast($"{_player.Name},{_player.X},{_player.Y},{_player.Radius}");
```

- We create `MakeNewConnection()` method which will accept GamePeer as parameter, this method will ask for server ip address and server port to connect to, then connect with `peer.ConnectToGamePeer(address, port);`
	- The address is string type and port is ushort type or Int16 type, we can use `Convert.ToUInt16()` method to convert user's input to ushort then use it in `peer.ConnectToGamePeer(address, port);`


### 5. Program.cs

- This class will create
	- a game window e.g. `Window gameWindow = new Window("Big Eat Small", 900, 900);` a window named Big Eat Small with width and height of 900 pixel
	- a game e.g. `Game game = new Game(gameWindow);`
- This class will wrap `SplashKit.ProcessEvents();` and methods in game `HandleInput()`, `Update()`, `Draw()` and window refresh method `gameWindow.Refresh(60);` in a do while loop, if the game did not return Quit as true, it will loop again and again.
	- `HandleInput()` and other methods within Game class can't be call directly we need to refer it so use `game.HandleInput()` for the rest methods resides in Game class, same rule applies
