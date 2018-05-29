using System;
using SplashKitSDK;

public class Program
{
    /// <summary>
    /// A Test application to demonstrate the use of Animations in SplashKit.
    /// </summary>
    public static void Main()
    {
        Window w = new Window("Animation Test", 120, 120);
        
        // We could load all of the resources in a bundle
        // SplashKit.LoadResourceBundle("dance bundle", "dance_bundle.txt");
        //
        // Then access by name
        // AnimationScript danceScript = SplashKit.AnimationScriptNamed("WalkingScript");
        // Bitmap frog = SplashKit.BitmapNamed("FrogBmp");

        // Loading them separately

        // Load image and set its cell details
        Bitmap frog = SplashKit.LoadBitmap("FrogBmp","Frog.png");
        frog.SetCellDetails(73, 105, 4, 4, 16); // cell width, height, cols, rows, count

        // Load the animation script
        AnimationScript danceScript = SplashKit.LoadAnimationScript("WalkingScript", "kermit.txt");

        // Create the animation
        Animation test = danceScript.CreateAnimation("WalkFront");

        // Create a drawing option
        DrawingOptions opt;
        opt = SplashKit.OptionWithAnimation(test);

        // Basic event loop
        while(! w.CloseRequested)
        {
            // Draw the bitmap - using opt to link to animation
            w.Clear(Color.White);
            w.DrawBitmap(frog, 20, 20, opt);
            w.Refresh(60);

            // Update the animation
            test.Update();

            SplashKit.ProcessEvents();

            // Switch animations
            if ( SplashKit.KeyTyped(KeyCode.UpKey))
            {
                test.Assign("WalkBack");
            }
            else if ( SplashKit.KeyTyped(KeyCode.DownKey))
            {
                test.Assign("WalkFront");
            }
            else if ( SplashKit.KeyTyped(KeyCode.DKey))
            {
                test.Assign("Dance");
            }
        }
    }
}
