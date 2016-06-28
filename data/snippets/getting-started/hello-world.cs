using System;
namespace HelloWorld
{
    class Hello
    {
        static void PrintHello(string name)
        {
            Console.WriteLine("Hello {0}!", name);
        }
        static void Main()
        {
            PrintHello("Fred");
        }
    }
}
