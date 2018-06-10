using SplashKitSDK;

class Program
{
    public static void Main()
    {
        SoundEffect sndEffect;

        SplashKit.OpenWindow("Sound Demo", 320, 240);

        sndEffect = new SoundEffect("chipmunk", "chipmunk.ogg");
        // or... 
        // sndEffect = SplashKit.LoadSoundEffect("chipmunk", "chipmunk.ogg");

        SplashKit.LoadSoundEffect("bells", "bells.ogg");
        SplashKit.LoadSoundEffect("camera", "camera.ogg");
        SplashKit.LoadSoundEffect("boing", "comedy_boing.ogg");
        SplashKit.LoadSoundEffect("dinosaur", "dinosaur.ogg");
        SplashKit.LoadSoundEffect("bark", "dog_bark.ogg");

        do
        {
            SplashKit.ProcessEvents();
            if (SplashKit.KeyDown(KeyCode.RightCtrlKey) || SplashKit.KeyDown(KeyCode.LeftCtrlKey))
            {
                if (SplashKit.KeyTyped(KeyCode.Num1Key))
                    sndEffect = SplashKit.SoundEffectNamed("chipmunk");
                if (SplashKit.KeyTyped(KeyCode.Num2Key))
                    sndEffect = SplashKit.SoundEffectNamed("bells");
                if (SplashKit.KeyTyped(KeyCode.Num3Key))
                    sndEffect = SplashKit.SoundEffectNamed("camera");
                if (SplashKit.KeyTyped(KeyCode.Num4Key))
                    sndEffect = SplashKit.SoundEffectNamed("boing");
                if (SplashKit.KeyTyped(KeyCode.Num5Key))
                    sndEffect = SplashKit.SoundEffectNamed("dinosaur");
                if (SplashKit.KeyTyped(KeyCode.Num6Key))
                    sndEffect = SplashKit.SoundEffectNamed("bark");
            }
            else
            {
                if (SplashKit.KeyTyped(KeyCode.Num1Key))
                    sndEffect.Play();
                if (SplashKit.KeyTyped(KeyCode.Num2Key))
                    sndEffect.Play(0.5f);
                if (SplashKit.KeyTyped(KeyCode.Num3Key))
                    sndEffect.Play(3, 0.25f);
                if (SplashKit.KeyTyped(KeyCode.Num4Key))
                    sndEffect.Play(-1, 0.1f);
                if (SplashKit.KeyTyped(KeyCode.Num5Key))
                {
                    if (sndEffect.IsPlaying)
                        sndEffect.Stop();
                }
            }

            SplashKit.ClearScreen(Color.White);

            SplashKit.DrawText("Control Sound (Escape or q to quit)", Color.Red, "arial", 18, 15, 15);
            SplashKit.DrawText("1: Play Sound At Full Volume", Color.Blue, "arial", 14, 20, 50);
            SplashKit.DrawText("2: Play Sound At 50% Volume", Color.Blue, "arial", 14, 20, 80);
            SplashKit.DrawText("3: Play Sound At 25% Volume 3 Times", Color.Blue, "arial", 14, 20, 110);
            SplashKit.DrawText("4: Play Sound Continuously at 10%", Color.Blue, "arial", 14, 20, 140);
            SplashKit.DrawText("5: Stop Playing Current Sound", Color.Blue, "arial", 14, 20, 170);
            SplashKit.DrawText("CTRL + (1-6) switch sound effects", Color.Blue, "arial", 14, 20, 200);

            SplashKit.RefreshScreen(60);
        } while (!(SplashKit.QuitRequested() || SplashKit.KeyTyped(KeyCode.EscapeKey) || SplashKit.KeyTyped(KeyCode.QKey)));
    }
}