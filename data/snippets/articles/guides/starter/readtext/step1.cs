using SplashKitSDK;

public class Program
{
    public static void Main()
    {
        string name;    // declare a variable to store the name
        string quest;   // and another to store a quest

        SplashKit.Write("What is your name: ");  // prompt the user for input
        name = SplashKit.ReadLine();             // read user input

        // Read in another value
        SplashKit.Write(name + " what is your quest?");
        quest = SplashKit.ReadLine();

        SplashKit.WriteLine(quest);
    }
}