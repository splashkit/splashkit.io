---

title: Guide to create a simple multiplayer networked game with SplashKit
date: 2018-05-13 16:25 UTC
tags: graphics,window,soundeffect
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
  - play_sound_effect
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
- ***[0. Pre-Guide](#0pre-guide)***
- ***[1. Player.cs](#1-playercs)***
	- [1.1 Define required variables, fields and properties.](#11-define-required-variables-fields-and-properties)
	- [1.2 Create class constructor](#12-create-class-constructor)
	- [1.3 Create the rest of the class](#13-create-the-rest-of-the-class)
	- [1.4 Complete code](#14-complete-code)
- ***[2. OtherPlayer.cs](#2-otherplayercs)***
	- [2.1 Define required variables, fields and properties.](#21-define-required-variables-fields-and-properties)
	- [2.2 Create class constructor](#22-create-class-constructor)
	- [2.3 Create the rest of the class](#23-create-the-rest-of-the-class)
	- [2.4 Complete code](#24-complete-code)
- ***[3. RandomDots.cs](#3-randomdotscs)***
	- [3.1 Define required variables, fields and properties.](#31-define-required-variables-fields-and-properties)
	- [3.2 Create class constructor](#32-create-class-constructor)
	- [3.3 Create the rest of the class](#33-create-the-rest-of-the-class)
	- [3.4 Complete code](#34-complete-code)
- ***[4. Function.cs](#4-functioncs)***
	- [4.1 Complete code](#41-complete-code)
- ***[5. Network.cs](#5-networkcs)***
	- [5.1 Complete code](#51-complete-code)
- ***[6. Game.cs](#6-gamecs)***
	- [6.1 Define required variables, fields and properties.](#61-define-required-variables-fields-and-properties)
	- [6.2 Create class constructor](#62-create-class-constructor)
	- [6.3 Create the rest of the class](#63-create-the-rest-of-the-class)
	- [6.4 Complete code](#64-complete-code)
- ***[7. Player.cs](#7-playercs)***
	- [7.1 Complete code](#71-complete-code)
---


### 0. Pre-Guide
#### Before writing the code, some installation need to be done
[SplashKit Instllation](http://www.splashkit.io/articles/installation/)



### 1. Player.cs
#### This class defines everything a player object can do and know.

##### 1.1 Define required variables, fields and properties.
```csharp
    public int Score { get; set; } = 0;
    public string Name { get; set; }
    public double X { get; private set; }
    public double Y { get; private set; }
    public double Radius { get; set; } = 10;
    public Circle c; //For collision circle purpose
    private Color PlayerColor;
    private int Boost = 0;
    private int Speed = 5;
    private bool PlayerWrapAroundTheWindow = false; //Wrap around or stop at the edge of the window
    private int _NameWidth;
    private SoundEffect GoodSound = new SoundEffect("pop", "pop.wav"); //When eat smaller ones
    private SoundEffect BadSound = new SoundEffect("beep", "beep.wav"); //When bitten by bigger ones
    public bool Quit { get; private set; }
```

##### 1.2 Create class constructor
```csharp
    //Player object need to know which window to draw on and remeber its own name
    public Player(Window gameWindow, string name)
    {
       //Place the player object at the center of the screen.
        X = gameWindow.Width / 2;
        Y = gameWindow.Height / 2;
        Name = name;
       //Give the player object a random color using RandomRGBColor from SplashKit
        PlayerColor = SplashKit.RandomRGBColor(200);
       //Set width of name, so that we can align the name and player object in middle vertically
        _NameWidth = SplashKit.TextWidth(name, "Arial", 10);
    }
```

##### 1.3 Create the rest of the class
```csharp
    //Draw the player object on the game window
    public void Draw()
    {
        SplashKit.FillCircle(PlayerColor, X, Y, Radius); //Draw the player object with random color
        c = SplashKit.CircleAt(X, Y, Radius); //Draw circle for used of collision 

        SplashKit.DrawText(Name, Color.Black, X - _NameWidth / 2, Y - Radius - 8); //Display Name
        SplashKit.DrawText(Convert.ToString(Score), Color.Black, X - 3, Y + Radius); //Display score
    }

    //Process input from the keyboard for controlling the player object in the game
    //E.g. move the player with WASD keys
    public void HandleInput()
    {
        if (SplashKit.KeyReleased(SplashKitSDK.KeyCode.IKey))
        {
            if (Boost <= 5)
            {
                Boost++;
                if (Boost >= 6)
                {
                    Boost = 1;
                }
            }
            switch (Boost)
            {
                case 1:
                    Speed = 5;
                    break;

                case 2:
                    Speed = 10;
                    break;

                case 3:
                    Speed = 15;
                    break;

                case 4:
                    Speed = 20;
                    break;

                case 5:
                    Speed = 50;
                    break;
            }
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.EscapeKey))
        {
            Quit = true;
        }

        if (SplashKit.QuitRequested())
        {
            Quit = true;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.LeftKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.AKey))
        {
            X -= Speed;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.RightKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.DKey))
        {
            X += Speed;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.UpKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.WKey))
        {
            Y -= Speed;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.DownKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.SKey))
        {
            Y += Speed;
        }
    }

    //Player will stay on the window or wrap around the window
    public void StayOnWindow(Window gameWindow)
    {

        int windowWidth = gameWindow.Width;
        int windowHeight = gameWindow.Height;

        if (!PlayerWrapAroundTheWindow)
        {
            //Player stops at Boundary
            if (X - Radius <= 0)
            {
                X = Radius;
            }

            if (X + Radius >= (windowWidth))
            {
                X = windowWidth - Radius;
            }

            if (Y - Radius <= 0)
            {
                Y = Radius;
            }

            if (Y + Radius >= windowHeight)
            {
                Y = windowHeight - Radius;
            }
            //Player stops at Boundary
        }
        else
        {
            //Player wrap around the screen
            if (X + Radius < 0)
            {
                X = windowWidth;
            }

            if (X > windowWidth)
            {
                X = -Radius;
            }

            if (Y + Radius < 0)
            {
                Y = windowHeight;
            }

            if (Y > windowHeight)
            {
                Y = -Radius;
            }
            //Player wrap around the screen
        }
    }

    //Return true if the circle of Player object intersect with Random dots
    public bool CollidedWithRandomDots(RandomDots randomDots)
    {
        return SplashKit.CirclesIntersect(c, randomDots.CollisionCircle);
    }

    //Return true if two players collided (Two local players in local game without network)
    public bool CollidedWithPlayer(Player player)
    {
        //TODO: change it, make it work
        return false;
    }

    //Collided with player from the network
    public bool CollidedWithPlayer(OtherPlayer op)
    {
        return SplashKit.CirclesIntersect(c, op.CollisionCircle);
    }

    //Play the pop sound when eat smaller dots
    public void PlayGoodSound()
    {
        GoodSound.Play();
    }

    //Play the beep sound when bitten by bigger dots
    public void PlayBadSound()
    {
        BadSound.Play();
    }
```

##### 1.4 Complete code
```csharp
using System;
using SplashKitSDK;

public class Player
{
    public int Score { get; set; } = 0;
    public string Name { get; set; }
    public double X { get; private set; }
    public double Y { get; private set; }
    public double Radius { get; set; } = 10;
    public Circle c;
    private Color PlayerColor;

    private int Boost = 0;
    private int Speed = 5;
    private bool PlayerWrapAroundTheWindow = false;
    private int _NameWidth;
    private SoundEffect GoodSound = new SoundEffect("pop", "pop.wav");
    private SoundEffect BadSound = new SoundEffect("beep", "beep.wav");

    public Player(Window gameWindow, string name)
    {
        X = gameWindow.Width / 2;
        Y = gameWindow.Height / 2;
        Name = name;

        PlayerColor = SplashKit.RandomRGBColor(200);

        _NameWidth = SplashKit.TextWidth(name, "Arial", 10);
    }


    public void Draw()
    {
        SplashKit.FillCircle(PlayerColor, X, Y, Radius);
        c = SplashKit.CircleAt(X, Y, Radius);

        SplashKit.DrawText(Name, Color.Black, X - _NameWidth / 2, Y - Radius - 8);
        SplashKit.DrawText(Convert.ToString(Score), Color.Black, X - 3, Y + Radius);
    }

    public bool Quit { get; private set; }

    public void HandleInput()
    {
        if (SplashKit.KeyReleased(SplashKitSDK.KeyCode.IKey))
        {
            if (Boost <= 5)
            {
                Boost++;
                if (Boost >= 6)
                {
                    Boost = 1;
                }
            }
            switch (Boost)
            {
                case 1:
                    Speed = 5;
                    break;

                case 2:
                    Speed = 10;
                    break;

                case 3:
                    Speed = 15;
                    break;

                case 4:
                    Speed = 20;
                    break;

                case 5:
                    Speed = 50;
                    break;
            }
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.EscapeKey))
        {
            Quit = true;
        }

        if (SplashKit.QuitRequested())
        {
            Quit = true;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.LeftKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.AKey))
        {
            X -= Speed;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.RightKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.DKey))
        {
            X += Speed;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.UpKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.WKey))
        {
            Y -= Speed;
        }

        if (SplashKit.KeyDown(SplashKitSDK.KeyCode.DownKey) || SplashKit.KeyDown(SplashKitSDK.KeyCode.SKey))
        {
            Y += Speed;
        }
    }

    public void StayOnWindow(Window gameWindow)
    {

        int windowWidth = gameWindow.Width;
        int windowHeight = gameWindow.Height;

        if (!PlayerWrapAroundTheWindow)
        {
            //Player stops at Boundary
            if (X - Radius <= 0)
            {
                X = Radius;
            }

            if (X + Radius >= (windowWidth))
            {
                X = windowWidth - Radius;
            }

            if (Y - Radius <= 0)
            {
                Y = Radius;
            }

            if (Y + Radius >= windowHeight)
            {
                Y = windowHeight - Radius;
            }
            //Player stops at Boundary
        }
        else
        {
            //Player wrap around the screen
            if (X + Radius < 0)
            {
                X = windowWidth;
            }

            if (X > windowWidth)
            {
                X = -Radius;
            }

            if (Y + Radius < 0)
            {
                Y = windowHeight;
            }

            if (Y > windowHeight)
            {
                Y = -Radius;
            }
            //Player wrap around the screen
        }
    }

    public bool CollidedWithRandomDots(RandomDots randomDots)
    {
        return SplashKit.CirclesIntersect(c, randomDots.CollisionCircle);
    }

    public bool CollidedWithPlayer(Player player)
    {
        //TODO: change it, make it work
        return false;
    }

    public bool CollidedWithPlayer(OtherPlayer op)
    {
        return SplashKit.CirclesIntersect(c, op.CollisionCircle);
    }

    public void PlayGoodSound()
    {
        GoodSound.Play();
    }

    public void PlayBadSound()
    {
        BadSound.Play();
    }
}
```


### 2. OtherPlayer.cs
#### This class defines everything an  OtherPlayer object can do and know, this class will be used for showing the object and status of the player from the other end of the network

##### 2.1 Define required variables, fields and properties.
```csharp
    //The variables and properties for other players is very similar with player class since they almost perform similar roles, other player class do not have HandleInput method since it's controlled by the other player over the network, in the future abstract class can be introduced to further optimize the code


    public string Name { get; set; }
    public double X { get; set; }
    public double Y { get; set; }
    public int Score { get; set; } = 0;
    public double Radius { get; set; } = 10;
    private Color PlayerColor;
    private int _NameWidth;

    public Circle CollisionCircle
    {
        get
        {
            return SplashKit.CircleAt(X, Y, Radius);
        }
    }
```


##### 2.2 Create class constructor
```csharp
    //Player object need to know which window to draw on, its name, color, score, radius, and positoin
    public OtherPlayer(string name, double x, double y, double radius, int score, Color color)
    {
        Name = name;
        X = x;
        Y = y;
        Radius = radius;
        PlayerColor = color;
        Score = score;
        _NameWidth = SplashKit.TextWidth(name, "Arial", 10);
    }
```


##### 2.3 Create the rest of the class
```csharp
    //Like player class, it can draw itself, but it has less code as mentioned previously, this is it for OtherPlayer class
    public void Draw()
    {
        SplashKit.FillCircle(PlayerColor, X, Y, Radius);
        SplashKit.DrawText(Name, Color.Red, X - _NameWidth / 2, Y - Radius - 8);
        SplashKit.DrawText(Convert.ToString(Score), Color.Black, X - 3, Y + Radius);
    }
```


##### 2.4 Complete code
```csharp
using System;
using SplashKitSDK;

public class OtherPlayer
{
    public string Name { get; set; }
    public double X { get; set; }
    public double Y { get; set; }
    public int Score { get; set; } = 0;
    public double Radius { get; set; } = 10;
    private Color PlayerColor;
    private int _NameWidth;

    public OtherPlayer(string name, double x, double y, double radius, int score, Color color)
    {
        Name = name;
        X = x;
        Y = y;
        Radius = radius;
        PlayerColor = color;
        Score = score;
        _NameWidth = SplashKit.TextWidth(name, "Arial", 10);
    }

    public void Draw()
    {
        SplashKit.FillCircle(PlayerColor, X, Y, Radius);
        SplashKit.DrawText(Name, Color.Red, X - _NameWidth / 2, Y - Radius - 8);
        SplashKit.DrawText(Convert.ToString(Score), Color.Black, X - 3, Y + Radius);
    }

    public Circle CollisionCircle
    {
        get
        {
            return SplashKit.CircleAt(X, Y, Radius);
        }
    }
}

```


### 3. RandomDots.cs
#### This class defines everything a random dot object can do and know and its properties

##### 3.1 Define required variables, fields and properties.
```csharp
    //Similarly, the random dots have X,Y for position purpose, radius for the size of the dot, and color for different appearance
    public double X { get; set; }
    public double Y { get; set; }
    public double Radius { get; set; }
    public Color MainColor;

    //Define the collision circle which will be used to determin collision between player and random dots
    public Circle CollisionCircle
    {
        get
        {
            return SplashKit.CircleAt(X, Y, Radius);
        }
    }
```


##### 3.2 Create class constructor
```csharp
    //To create a random dot, it needs to know the window width and height in order to draw within the window, it also needs to know the radius so that it can draw in different size
    public RandomDots(Window gameWindow, double radius)
    {
        MainColor = Color.RandomRGB(200);
        Radius = radius;

        //RdnInclusive is a staic method in Function class we created for returning number with given range inclusively, it will be discussed in section 4
        X = Function.RdnInclusive(1, gameWindow.Width - 10);
        Y = Function.RdnInclusive(1, gameWindow.Height - 10);
    }
```


##### 3.3 Create the rest of the class
```csharp
    //Again, it will draw on screen once this Draw() method been called
    public void Draw()
    {
        SplashKit.FillCircle(MainColor, X, Y, Radius);
    }
```


##### 3.4 Complete code
```csharp
using SplashKitSDK;

public class RandomDots
{
    public double X { get; set; }
    public double Y { get; set; }
    public double Radius { get; set; }

    public Color MainColor;
    public RandomDots(Window gameWindow, double radius)
    {
        MainColor = Color.RandomRGB(200);
        Radius = radius;

        X = Function.RdnInclusive(1, gameWindow.Width - 10);
        Y = Function.RdnInclusive(1, gameWindow.Height - 10);
    }

    public void Draw()
    {
        SplashKit.FillCircle(MainColor, X, Y, Radius);
    }

    public Circle CollisionCircle
    {
        get
        {
            return SplashKit.CircleAt(X, Y, Radius);
        }
    }
}

```


### 4. Function.cs
#### This static class stores function/method that does not belong to any classes but will be used in more than one classes, in this case it is RdnInclusive function which metioned in section 3

##### 4.1 Complete code
```csharp
using System;

public static class Function
{
    public static int RdnInclusive(int min, int max)
    {
        Random rnd = new Random();
        //E.g. min = 1, max = 5, returned number will be between 1 and 5 including 1 and 5
        int tmp = rnd.Next(min, max + 1);
        return tmp;
    }
}
```


### 5. Network.cs
#### This class contains everything we need for processing networking related tasks, only used when choose to play online game (Slightly modified based on [Andrew](https://github.com/macite)'s Chat program example)

##### 5.1 Complete code
```csharp
using System;
using SplashKitSDK;
using System.Collections.Generic;

public class GamePeer
{
    public string Name { get; set; }
    private ServerSocket _server;

    private Dictionary<string, Connection> _peers = new Dictionary<string, Connection>();

    public string GetMsg { get; private set; }

    public ServerSocket Server
    {
        get
        {
            return _server;
        }
    }

    public GamePeer(ushort port)
    {
        _server = new ServerSocket("GameServer", port);
    }

    public void ConnectToGamePeer(string address, ushort port)
    {
        Connection newConnection = new Connection($"{address }:{port}", address, port);
        if (newConnection.IsOpen)
        {
            Console.WriteLine($"Conected to {address}:{port}");
        }
    }

    private void EstablishConnection(Connection con)
    {
        // Send my name...
        con.SendMessage(Name);

        // Wait for a message...
        SplashKit.CheckNetworkActivity();
        for (int i = 0; i < 10 && !con.HasMessages; i++)
        {
            //SplashKit.Delay(200);
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

    //Check if there is new connection
    public void CheckNewConnections()
    {
        while (_server.HasNewConnections)
        {
            Connection newConnection = _server.FetchNewConnection();
            try
            {
                EstablishConnection(newConnection);
            }
            catch
            {
                // ignore errors
            }
        }
    }

    //Broadcast message to everyone who connected to server
    public void Broadcast(string message)
    {
        SplashKit.BroadcastMessage(message);
    }

    //Get message sent by peer over the network
    public string GetNewMessages()
    {
        SplashKit.CheckNetworkActivity();

        while (SplashKit.HasMessages())
        {
            using (Message m = SplashKit.ReadMessage())
            {
                GetMsg = m.Data;
            }
        }
        return GetMsg;
    }

    //Close the connection properly
    public void Close()
    {
        _server.Close();
        SplashKit.CloseAllConnections();
    }
}
```


### 6. Game.cs
#### This class will handle the logic of the whole game, including local game and multiplayer networked game

##### 6.1 Define required variables, fields and properties.
```csharp
    private Player _player;
    private Window _gameWindow;
    //For storing instantized random dots object
    private List<RandomDots> _randomDots = new List<RandomDots>();
    public bool OnlineGame { get; private set; } //Onlin/Offline game switcher
    public bool IsServer { get; private set; } //The game is host (server) or client
    public GamePeer ThisPeer { get; private set; } //For network usage
    private string _otherPlayerMsg; //Store message received over network

    private List<OtherPlayer> _otherPlayers = new List<OtherPlayer>(); //Store OtherPlayer objects
    //Store name of the other player over the network
    private List<string> _otherNetworkNames = new List<string>();
    //Maximum number of random dots on screen, avoid screen covered by random dots
    private int NumOfRandomDotsOnScreen = 15;

    private string name = ""; //Store name of the current player

    private double x = 0, y = 0, radius = 0; //Store position and radius information of OtherPlayer
    private int score = 0; //Store score of OtherPlayer
    private SoundEffect bgm = new SoundEffect("bgm", "bgm.wav"); //Background music for the game

    //If the current Player quit the game, then return true
    public bool Quit
    {
        get
        {
            return _player.Quit;
        }
    }
```


##### 6.2 Create class constructor
```csharp
    //The game needs to know, where to draw objects like player, otherplayer random dots etc
    public Game(Window window)
    {
        //Before starting the game, we need to know a couple of things from the user
        //Name of the user
        string answer;
        Console.Write("What is your name: ");
        string name = Console.ReadLine();

        //Online or offline game
        do
        {
            Console.Write("Do you want to play it online? (Y/N) ");
            answer = Console.ReadLine();
        }
        while (answer.ToUpper() != "Y" && answer.ToUpper() != "N");

        if (answer.ToUpper() == "N") // Not online game, offline game
        {
            OnlineGame = false;
        }
        else if (answer.ToUpper() == "Y") // Online game
        {
            OnlineGame = true;
            Console.Write("Which port to run at: ");
            ushort port = Convert.ToUInt16(Console.ReadLine());
            GamePeer peer = new GamePeer(port) { Name = name };
            ThisPeer = peer;

            //This is the host/server for the game or client
            string isHost;
            do
            {
                Console.Write("Is this the host? (Y/N) ");
                isHost = Console.ReadLine();
            } while (isHost.ToUpper() != "Y" && isHost.ToUpper() != "N");

            if (isHost.ToUpper() == "N") // Not host server, select server to connect to
            {
                IsServer = false;
                MakeNewConnection(peer);
            }
            else if (isHost.ToUpper() == "Y") // Be the host server
            {
                IsServer = true;
            }
        }

        //After we gathered enough information, initialize the game and objects that needs to be created 
        _gameWindow = window;

        Player Player = new Player(window, name);
        _player = Player;

        Console.WriteLine("Please switch back to game window!");
    }
```


##### 6.3 Create the rest of the class
```csharp
   //Handle all inputs, in this case inputs from player
   public void HandleInput()
    {
        _player.HandleInput();
        _player.StayOnWindow(_gameWindow);
    }

   //Draw player, OtherPlayer and random dot objects on the window
    public void Draw()
    {
        _player.Draw();

        //Only draw if there are otherplayer exist
        if (_otherPlayers.Count > 0)
        {
            foreach (OtherPlayer op in _otherPlayers)
            {
                op.Draw();
            }
        }

        //Only draw if there are random dots exist
        if (_randomDots.Count > 0)
        {
            foreach (RandomDots rd in _randomDots)
            {
                rd.Draw();
            }
        }
    }

    //Update the game
    public void Update()
    {
        //If this is an online game, update network information, including get information of otherplayer
        //and broadcast informtion of current player over network
        if (OnlineGame)
        {
            UpdateNetworkInfo();
            UpdateOtherPlayerInfo();
        }

        //Check if there is any collisions between player, otherplayer and random dots
        CheckCollisions();

        //If random dots on screen is less than pre-set value, add more.
        if (_randomDots.Count < NumOfRandomDotsOnScreen)
        {
            //In order to make the game playable, there must be some smaller dots available
			//so that player can eat and grow bigger following code is to determine if new
			//smaller dots needs to be created
            int tmp_small = 0;
            for (int i = 0; i < _randomDots.Count - 1; i++)
            {
                if (_randomDots[i].Radius < _player.Radius) { tmp_small++; }
            }

            if (tmp_small <= 2)
            {
                //Use RdnInclusive we've created previously, we are able to create dots with various
				//radius/size but still smaller than player's size, so that player can eat and grow
                _randomDots.Add(new RandomDots(_gameWindow, Function.RdnInclusive(3, Convert.ToInt32(_player.Radius - 2))));
            }
            else
            {
                do
                {
                    //If there are dots smaller than player, then create bigger sized random dots
                    _randomDots.Add(new RandomDots(_gameWindow, Function.RdnInclusive(Convert.ToInt32(_player.Radius + 1), Convert.ToInt32(_player.Radius + 20))));
                } while (_randomDots.Count < NumOfRandomDotsOnScreen);
            }
        }

		//Play the background music in a non-stop fashion
        if (!bgm.IsPlaying)
        {
            PlayBgm();
        }
    }

	//Check collisions between player, otherplayer and random dots
    private void CheckCollisions()
    {
        //This list will store all random dots which are ready to be removed
        List<RandomDots> rmRandomDots = new List<RandomDots>();
        foreach (OtherPlayer op in _otherPlayers)
        {
            //If player collided with otherlayer, whoever is bigger gets more score
			//deduct the score of the other one
            if (_player.CollidedWithPlayer(op))
            {
                if (_player.Radius < op.Radius)
                {
                    _player.Score--;
                }
                else if (_player.Radius > op.Radius)
                {
                    _player.Score++;
                }
            }
        }

		//If player collided with random dots, if player is bigger than the dot, then player will
		//gain some score, if player is smaller than the dot, player will lose some score
		//If player collided with bigger dots a beep will sound, if collided with smaller dots
		//a pop will sound
        foreach (RandomDots rd in _randomDots)
        {
            if (_player.CollidedWithRandomDots(rd))
            {
                rmRandomDots.Add(rd);
                if (rd.Radius > _player.Radius)
                {
                    _player.PlayBadSound();
                    if (_player.Radius - 5 > 5)
                    {
                        _player.Radius -= 5;
                    }
                    _player.Score -= 10;
                }
                else if (rd.Radius < _player.Radius)
                {
                    _player.PlayGoodSound();
                    _player.Score += 10;
                    _player.Radius += 1;
                }
            }
        }

		//Remove those dots which player collided with
        if (_randomDots.Count > 0)
        {
            foreach (RandomDots rd in rmRandomDots)
            {
                _randomDots.Remove(rd);
            }
        }
    }

	//Method to play the background music
    public void PlayBgm()
    {
        bgm.Play();
    }


	//Network related part
    #region Network, OtherPlayer

	//Process received message from network and broadcast message about current player's position
	//name, color information
    public void UpdateNetworkInfo()
    {
        if (IsServer)
        {
            //If this is the server, then listen on new incoming connection
            SplashKit.AcceptAllNewConnections();
        }

        _otherPlayerMsg = ThisPeer.GetNewMessages();

        UpdateOtherPlayer();
        BroadcastMessage();
    }

	//Process received message over network, and apply to otherplayer object
    public void UpdateOtherPlayer()
    {
        if (_otherPlayerMsg != null && _otherPlayerMsg.Length > 0)
        {
            name = _otherPlayerMsg.Split(',')[0];
            x = Convert.ToDouble(_otherPlayerMsg.Split(',')[1]);
            y = Convert.ToDouble(_otherPlayerMsg.Split(',')[2]);
            radius = Convert.ToDouble(_otherPlayerMsg.Split(',')[3]);
            score = Convert.ToInt32(_otherPlayerMsg.Split(',')[4]);
        }

        if (name.Length > 0)
        {
            if (!_otherNetworkNames.Contains(name))
            {
                _otherNetworkNames.Add(name);
                _otherPlayers.Add(new OtherPlayer(name, x, y, radius, score, Color.Gray));
            }
        }
    }

	//Update otherplayer object's position, size and score information, so that otherplayer will
	//appear on our screen and reflect what the the other user's status on our side
    public void UpdateOtherPlayerInfo()
    {
        foreach (OtherPlayer op in _otherPlayers)
        {
            op.X = x;
            op.Y = y;
            op.Radius = radius;
            op.Score = score;
        }
    }

	//Broadcast current player's name, X,Y, radius, and score information
	//Modified based on [Andrew](https://github.com/macite)'s Chat program example
    private void BroadcastMessage()
    {
        ThisPeer.Broadcast($"{_player.Name},{_player.X},{_player.Y},{_player.Radius},{_player.Score}");
    }

	//Make coneciton to game peer (host/server)
    private void MakeNewConnection(GamePeer peer)
    {
        string address;
        ushort port;

        Console.Write("Enter Host Server address: ");
        address = Console.ReadLine();

        Console.Write("Enter Host Server port: ");
        port = Convert.ToUInt16(Console.ReadLine());

        peer.ConnectToGamePeer(address, port);
    }

    #endregion
```


##### 6.4 Complete code
```csharp
using SplashKitSDK;
using System;
using System.Collections.Generic;

public class Game
{
    private Player _player;
    private Window _gameWindow;
    private List<RandomDots> _randomDots = new List<RandomDots>();
    public bool OnlineGame { get; private set; }
    public bool IsServer { get; private set; }
    public GamePeer ThisPeer { get; private set; }
    private string _otherPlayerMsg;

    private List<OtherPlayer> _otherPlayers = new List<OtherPlayer>();
    private List<string> _otherNetworkNames = new List<string>();
    private int NumOfRandomDotsOnScreen = 15;

    private string name = "";
    private double x = 0, y = 0, radius = 0;
    private int score = 0;
    private SoundEffect bgm = new SoundEffect("bgm", "bgm.wav");


    public bool Quit
    {
        get
        {
            return _player.Quit;
        }
    }

    public Game(Window window)
    {
        string answer;
        Console.Write("What is your name: ");
        string name = Console.ReadLine();

        do
        {
            Console.Write("Do you want to play it online? (Y/N) ");
            answer = Console.ReadLine();
        }
        while (answer.ToUpper() != "Y" && answer.ToUpper() != "N");

        if (answer.ToUpper() == "N") // Not online game, offline game
        {
            OnlineGame = false;
        }
        else if (answer.ToUpper() == "Y") // Online game
        {
            OnlineGame = true;
            Console.Write("Which port to run at: ");
            ushort port = Convert.ToUInt16(Console.ReadLine());
            GamePeer peer = new GamePeer(port) { Name = name };
            ThisPeer = peer;

            string isHost;
            do
            {
                Console.Write("Is this the host? (Y/N) ");
                isHost = Console.ReadLine();
            } while (isHost.ToUpper() != "Y" && isHost.ToUpper() != "N");

            if (isHost.ToUpper() == "N") // Not host server, select server to connect to
            {
                IsServer = false;
                MakeNewConnection(peer);
            }
            else if (isHost.ToUpper() == "Y") // Be the host server
            {
                IsServer = true;
            }
        }

        _gameWindow = window;

        Player Player = new Player(window, name);
        _player = Player;

        Console.WriteLine("Please switch back to game window!");
    }

    public void HandleInput()
    {
        _player.HandleInput();
        _player.StayOnWindow(_gameWindow);
    }

    public void Draw()
    {
        _player.Draw();

        if (_otherPlayers.Count > 0)
        {
            foreach (OtherPlayer op in _otherPlayers)
            {
                op.Draw();
            }
        }

        if (_randomDots.Count > 0)
        {
            foreach (RandomDots rd in _randomDots)
            {
                rd.Draw();
            }
        }
    }

    public void Update()
    {
        if (OnlineGame)
        {
            UpdateNetworkInfo();
            UpdateOtherPlayerInfo();
        }

        CheckCollisions();

        if (_randomDots.Count < NumOfRandomDotsOnScreen)
        {
            int tmp_small = 0;
            for (int i = 0; i < _randomDots.Count - 1; i++)
            {
                if (_randomDots[i].Radius < _player.Radius) { tmp_small++; }
            }

            if (tmp_small <= 2)
            {
                _randomDots.Add(new RandomDots(_gameWindow, Function.RdnInclusive(3, Convert.ToInt32(_player.Radius - 2))));
            }
            else
            {
                do
                {
                    _randomDots.Add(new RandomDots(_gameWindow, Function.RdnInclusive(Convert.ToInt32(_player.Radius + 1), Convert.ToInt32(_player.Radius + 20))));
                } while (_randomDots.Count < NumOfRandomDotsOnScreen);
            }
        }

        if (!bgm.IsPlaying)
        {
            PlayBgm();
        }
    }

    private void CheckCollisions()
    {
        List<RandomDots> rmRandomDots = new List<RandomDots>();
        foreach (OtherPlayer op in _otherPlayers)
        {
            if (_player.CollidedWithPlayer(op))
            {
                if (_player.Radius < op.Radius)
                {
                    _player.Score--;
                }
                else if (_player.Radius > op.Radius)
                {
                    _player.Score++;
                }
            }
        }

        foreach (RandomDots rd in _randomDots)
        {
            if (_player.CollidedWithRandomDots(rd))
            {
                rmRandomDots.Add(rd);
                if (rd.Radius > _player.Radius)
                {
                    _player.PlayBadSound();
                    if (_player.Radius - 5 > 5)
                    {
                        _player.Radius -= 5;
                    }
                    _player.Score -= 10;
                }
                else if (rd.Radius < _player.Radius)
                {
                    _player.PlayGoodSound();
                    _player.Score += 10;
                    _player.Radius += 1;
                }
            }
        }

        if (_randomDots.Count > 0)
        {
            foreach (RandomDots rd in rmRandomDots)
            {
                _randomDots.Remove(rd);
            }
        }
    }

    public void PlayBgm()
    {
        bgm.Play();
    }

    #region Network, OtherPlayer
    public void UpdateNetworkInfo()
    {
        if (IsServer)
        {
            SplashKit.AcceptAllNewConnections();
        }

        _otherPlayerMsg = ThisPeer.GetNewMessages();

        UpdateOtherPlayer();
        BroadcastMessage();
    }

    public void UpdateOtherPlayer()
    {
        if (_otherPlayerMsg != null && _otherPlayerMsg.Length > 0)
        {
            name = _otherPlayerMsg.Split(',')[0];
            x = Convert.ToDouble(_otherPlayerMsg.Split(',')[1]);
            y = Convert.ToDouble(_otherPlayerMsg.Split(',')[2]);
            radius = Convert.ToDouble(_otherPlayerMsg.Split(',')[3]);
            score = Convert.ToInt32(_otherPlayerMsg.Split(',')[4]);
        }

        if (name.Length > 0)
        {
            if (!_otherNetworkNames.Contains(name))
            {
                _otherNetworkNames.Add(name);
                _otherPlayers.Add(new OtherPlayer(name, x, y, radius, score, Color.Gray));
            }
        }
    }


    public void UpdateOtherPlayerInfo()
    {
        foreach (OtherPlayer op in _otherPlayers)
        {
            op.X = x;
            op.Y = y;
            op.Radius = radius;
            op.Score = score;
        }
    }

    private void BroadcastMessage()
    {
        ThisPeer.Broadcast($"{_player.Name},{_player.X},{_player.Y},{_player.Radius},{_player.Score}");
    }

    private void MakeNewConnection(GamePeer peer)
    {
        string address;
        ushort port;

        Console.Write("Enter Host Server address: ");
        address = Console.ReadLine();

        Console.Write("Enter Host Server port: ");
        port = Convert.ToUInt16(Console.ReadLine());

        peer.ConnectToGamePeer(address, port);
    }

    #endregion
}
```


### 7. Player.cs
#### This class is the entry point of the program

##### 7.1 Complete code
```csharp
using SplashKitSDK;

public class Program
{
    public static void Main()
    {
        //Create new window object for drawing game objects on
        Window gameWindow = new Window("Big Eat Small", 900, 900);
		//Create the game
        Game game = new Game(gameWindow);

		//Start the game loop, until player requested to quit
        do
        {
            SplashKit.ProcessEvents();
            gameWindow.Clear(Color.AliceBlue);
            game.HandleInput();
            game.Update();
            game.Draw();
            gameWindow.Refresh(60);
        } while (!game.Quit);
    }
}
```

## Results

![Image of the game in multiplayer mode](https://i.imgur.com/nT2jsvp.png)
