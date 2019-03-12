---

title: Installing the .NET Core SDK on Windows
tags: installation,windows,dotnet

---

To get programming with C#, you can install the Dotnet Core tools

1. Open an MSYS2 terminal
1. Run the following command:

    `pacman -S mingw-w64-{x86_64,i686}-gcc mingw-w64-{i686,x86_64}-gdb`

    ![](images/install-gifs/Windows/install-gpp-msys.gif)

1. Go to the [dotnet core](https://www.microsoft.com/net/core) page.

    Select `windows`, `command line/other` then download the `.net core sdk`.

    ![](images/install-gifs/Windows/8.gif)

1. Run the installer and continue through the install wizard with default values.

    ![](images/install-gifs/Windows/9.gif)

1. Install the C# extension in Visual Studio Code.

    The C# extension will give you a great code formatter, Intellisense and OmniSharp. Open the extensions panel in the left of Visual Studio Code, and search for the extension `C#`, install the one by Microsoft.

Return to the [overview of the windows install](/articles/installation/windows).
