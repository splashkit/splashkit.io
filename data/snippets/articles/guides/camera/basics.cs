using System;
using SplashKitSDK;

public class Program
{
    public const int SCREEN_BORDER = 100;

    private static void UpdateCameraPosition(double playerX, double playerY)
    {
        // Test edge of screen boundaries to adjust the camera
        double leftEdge = Camera.X + SCREEN_BORDER;
        double rightEdge = leftEdge + SplashKit.ScreenWidth() - 2 * SCREEN_BORDER;
        double topEdge = Camera.Y + SCREEN_BORDER;
        double bottomEdge = topEdge + SplashKit.ScreenHeight() - 2 * SCREEN_BORDER;

        // Test if the player is outside the area and move the camera
        // the player will appear to stay still and everything else
        // will appear to move :)

        // Test top/bottom of screen
        if (playerY < topEdge)
        {
            SplashKit.MoveCameraBy(0, playerY - topEdge);
        }
        else if (playerY > bottomEdge)
        {
            SplashKit.MoveCameraBy(0, playerY - bottomEdge);
        }

        // Test left/right of screen
        if (playerX < leftEdge)
        {
            SplashKit.MoveCameraBy(playerX - leftEdge, 0);
        }
        else if (playerX > rightEdge)
        {
            SplashKit.MoveCameraBy(playerX - rightEdge, 0);
        }
    }

    public static void Main()
    {
        new Window("Camera Test", 800, 800);

        double playerX = 400, playerY = 400;

        while ( ! SplashKit.QuitRequested() )
        {
            // Handle input to adjust player movement
            SplashKit.ProcessEvents();
            
            if (SplashKit.KeyDown(KeyCode.LeftKey))   playerX -= 3;
            if (SplashKit.KeyDown(KeyCode.RightKey))  playerX += 3;
            if (SplashKit.KeyDown(KeyCode.DownKey))   playerY += 3;
            if (SplashKit.KeyDown(KeyCode.UpKey))     playerY -= 3;

            UpdateCameraPosition(playerX, playerY);

            // Redraw everything
            SplashKit.ClearScreen(Color.Black);

            // Draw to the screen
            SplashKit.DrawText(SplashKit.PointToString(Camera.Position), Color.White, 0, 0, SplashKit.OptionToScreen());

            // as well as the player who can move
            SplashKit.FillCircle(Color.Yellow, playerX, playerY, 20);

            // including something stationary - it doesn't move
            SplashKit.FillRectangle(Color.White, 400, 200, 10, 10);
            SplashKit.DrawText("400,400", Color.White, 400, 400);

            SplashKit.RefreshScreen(60);
        }
    }
}
