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

##### 1.1 Define required variables, fields and properties.
- The player will have X, Y coordinates so that it can be drew on the game window.
We create property X and Y.

```csharp
public double X { get; private set; }
```
- Create a `Y` property.
- The player will have a `Name` property as `string` type.
- The Player will have a `Radius` property assgined as `double` type with default value of `10`.

```csharp
public double Radius { get; set; } = 10;
```
- A `Circle` variable `c` will be created for collision detection purpose.
- The player will have a `Color` stored in `PlayerColor`.
- The player can move around the screen, we give it a `Speed` in form of integer, with default speed of `5`.
- The player will have a `Quit` property in form of `boolean`, so that player can exit the game on wish.

##### 1.2 Create class constructor
- The player need to know where to draw itself and its name, so we should pass `Window gameWidow` and `string name` in constructor.
- Within the constructor, we assign X and Y points for player to draw on, and its name and color.

```csharp
X = gameWindow.Width / 2; //So it will appear at center of the screen
//Add Y here
//Set Name property to equal passed in name variable here
PlayerColor = SplashKit.RandomRGBColor(200); //We assign a random color to player's color property
```

##### 1.3 Create the rest of the class
- The player will have a `Draw()` method, so that it can draw it self when called
- This method will draw the player as a filled circle, a circle for collision detection and its name.

```csharp
SplashKit.FillCircle(PlayerColor, X, Y, Radius);
c = SplashKit.CircleAt(X, Y, Radius);
SplashKit.DrawText(Name, Color.Black, X - Radius, Y - Radius - 10);
```

- The player will have a HandleInput method, so that it can respond to keyboard stroke, in this game the player object can bed moved around by changing its X and Y, and exit the game by pressing ESC key.

```csharp
if (SplashKit.KeyDown(SplashKitSDK.KeyCode.EscapeKey)) //If Esc key is pressed
{
        Quit = true; //Then Quit is set to true, so that game will quit
}

if (SplashKit.KeyDown(SplashKitSDK.KeyCode.LeftKey)) //If Left arrow key pressed, the player will move left
{
        X -= Speed; //With our defined speed
}

        //Add left code to make it move to other directions.
```

- The player will return true if it collided with other player, in order to know which otherplayer it collided with, we need to pass in otherplayer to this method.

```csharp
    public bool CollidedWithPlayer(OtherPlayer op)
    {

    }
```
- To return the status of collision we use `CirclesIntersect` from SplashKit

```csharp
return SplashKit.CirclesIntersect(c, op.CollisionCircle);
```

### 2. OtherPlayer.cs
#### This class defines everything a OtherPlayer object can do and know. This class is used to show the other player over the network on our game window.

##### 2.1 Define required variables, fields and properties.
- The OtherPlayer will have similar structure with Player class but significantly less code.
- It has `Name`, `X`, `Y`, `Radius`, `PlayerColor` properties.
- The OtherPlayer will have a `CollisionCircle` property to return it's collision circle.
```csharp
return SplashKit.CircleAt(X, Y, Radius);
```

##### 2.2 Create class constructor
- In order to draw OtherPlayer on the screen later, we need to pass in `name`, `x`, `y`, `radius` to the constructor to start with and set properties from constructor.

```csharp
//With in the constructor
{
    //Assign name, x, y, radius
    PlayerColor = SplashKit.ColorGray(); //Here we give OtherPlayer on our screen a gray color
}
```

##### 2.3 Create the rest of the class
- The OhterPlayer will have `Draw()` method, which will draw a filled circle and name on top of it similar with Player class.


### 3. Network.cs
#### This class defines everything related to nerwork part that we need to use later in the game, based on [Andrew](https://github.com/macite)'s Chat program example

##### 3.1 Define required variables, fields and properties.
- A field to store peer's Name
- A field to store server port as `ServerSocket`
- A field to store `Dictionary<string, Connection>`
- A property that will return message from broadcast as string
- A property will return server socket information as ServerSocket

##### 3.2 Create class constructor
- The constructor will simply assign _server a name and a port parameter via passed in `port` as `ushort`

##### 3.3 Create the rest of the class
- The `ConnectToGamePeer` will be passed in address as ip address and port to connect to.

```csharp
//To make a new connection
Connection newConnection = new Connection($"{address }:{port}", address, port);

//To check if the connectoin is open (connected) we can use
```

- To check if the connectoin is open we can use `newConnection.IsOpen`
- We need to create a method to `EstablishConnection` which will take `Connection` type as parameter

```csharp
private void EstablishConnection(Connection con)
    {
        // Send my name...
        con.SendMessage(Name);

        // Wait for a message...
        SplashKit.CheckNetworkActivity();
        for (int i = 0; i < 10 && !con.HasMessages; i++)
        {
            SplashKit.CheckNetworkActivity();
        }

        if (!con.HasMessages)
        {
            con.Close();
            throw new Exception("Timeout waiting for name of peer");
        }

        // Read the name
        string name = con.ReadMessageData();

        // See if we can register this...
        if (_peers.ContainsKey(name))
        {
            con.Close();
            throw new Exception("Unable to connect to multiple peers with the same name");
        }

        // Register
        _peers[name] = con;
        Console.WriteLine($"Connected to {name} at { SplashKit.Ipv4ToStr(con.IP) }:{con.Port}");
    }
```

- In order to send message, we create a Broadcast method which will be passed in message as string, then use `SplashKit.BroadcastMessage()` method from SplashKit to broadcast message.
- Next we create a `GetNewMessage` method to receive and return the message from network.

```csharp
//First we need to check network activity
SplashKit.CheckNetworkActivity();

//Next we populate the message to `GetMsg` property when there is a message available and return the GetMsg
while (SplashKit.HasMessages())
{
        using (Message m = SplashKit.ReadMessage())
        {
                GetMsg = m.Data;
        }
}
```

- To close the connection properly we can use following code in a method

```csharp
_server.Close();
SplashKit.CloseAllConnections();
```


### 4. Game.cs
#### This class handles the logic of the whole game

##### 4.1 Define required variables, fields and properties.
- We will have `_Player` field to store player objecte we creat in the game
- We will have `OnlineGame` and `IsServer` as boolean, so that later we can act dependently
- We will have `ThisPeer` as our network object, so that later we can broadcast and receive message via network
- We will have `_otherPlayerMsg` field for storing message we get from other player over network
- We will have List of `_otherPlayers` as OtherPlayer and `_otherNetworkNames` as string to store otherPlayer object and name of otherPlayer we received over network
- We will have `name` as string, `x`, `y`, `radius` as double to store information for otherPlayer.
- We will have `Quit` property to return the status from player class `_player.Quit`


##### 4.2 Create class constructor
- The constructor will be passed in a Window parameter, so that it knows where to draw everything
- Once started, the constructor will ask player, name and if it's online or offline game, sever or client, port and ip address and then set corresponding variables and fields accordingly, following is example of how to ask and set the value so that we can use later. Then it will create the player object with defined name and passed in window.

```csharp
Console.Write("Do you want to play it online? (Y/N) ");
answer = Console.ReadLine();
if (answer.ToUpper() == "N")
{
         OnlineGame = false;
}

//If it is client then we need to create peer and then connect to server/host
GamePeer peer = new GamePeer(port) { Name = name };
MakeNewConnection(peer);
```

##### 4.3 Create the rest of the class
- `HandleInput()` will call indentical method in player class
- `Draw()` will call indentical method in player class and also draw each otherPlayer from otherPlayers list if this list contains 1 or more otherPlayer
- `Update()` method will call `CheckCollisions()` method to see if two players collided and also call `UpdateNetworkInfo()` and `UpdateOtherPlayerInfo()` methods if `OnlineGame` is set to true
- `CheckCollisions()` method will loop over each `_otherPlayers` to see if player collised with otherPlayer and print message to indicate collision
- Next we will create network and otherPlayer related parts
- `UpdateNetworkInfo()` method will store message we get from other player by using `ThisPeer.GetNewMessages()` to `_otherPlayerMsg` fied, call `UpdateOtherPlayer()` and `BroadcastMessage()` methods to Update otherPlayer's information on our game window and broadcast our player's information to networ, if `IsServer` is set, then this method will accept all new connections by using `SplashKit.AcceptAllNewConnections();`
- `UpdateOtherPlayer()` method will process incomming message if the message length is greater than 0, we split the string into pieces by comma, we use Split method from C#, `name = _otherPlayerMsg.Split(',')[0];`,`x = Convert.ToDouble(_otherPlayerMsg.Split(',')[1]);`, then if the length of name is greater than 0 and not exist in the `_otherNetworkNames` then we add the otherPlayer to the otherPlayers list
- After the otherPlayer has been added, we need to update its information depend on recieved information, so it moves on our screen as it does on the other player's screen, for each otherPlayer we update their X, Y and radius in `UpdateOtherPlayerInfo()` method
- We create a `BroadcastMessage()` which will broadcast current player's name, X, Y, and radius.

```csharp
ThisPeer.Broadcast($"{_player.Name},{_player.X},{_player.Y},{_player.Radius}");
```

- We create `MakeNewConnection()` method which will accept GamePeer as parameter, this method will ask for server ip address and server port to connect to, then connect with `peer.ConnectToGamePeer(address, port);`


### 5. Program.cs
- This class will create
 - a game window
 - a game

- Then it will loop through `SplashKit.ProcessEvents();` and methods in game `HandleInput()`, `Update()`, `Draw()` and window Refresh method, while the game did not return Quit as true
