using SplashKitSDK;

public class Program
{
    public static void Main(string[] args)
    {
        Window shapesWindow;
        shapesWindow = new Window("Shapes by ...", 800, 600);

        shapesWindow.Clear(Color.White);
        shapesWindow.FillEllipse(Color.BrightGreen, 0, 400, 800, 400);
        shapesWindow.FillRectangle(Color.Gray, 300, 300, 200, 200);
        shapesWindow.FillTriangle(Color.Red, 250, 300, 400, 150, 550, 300);
        shapesWindow.Refresh();

        SplashKit.Delay(5000);
    }
}