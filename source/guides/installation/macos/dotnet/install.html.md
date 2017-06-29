# Install Dotnet Core Tools

1. Install the [dotnet core library](https://microsoft.com/net/core), and follow the installation steps. Firstly, we need to install the [Brew Package Manager](https://brew.sh).

    ![](images/install-gifs/MacOS/6.gif)

1. And execute it in the terminal

    ![](images/install-gifs/MacOS/7.gif)

1. Then copy each line of the install pre-requisites.

    ![](images/install-gifs/MacOS/8.gif)

1. Continue on executing the install pre-requisites on the dotnet core page by copy-pasting the commands.

    ![](images/install-gifs/MacOS/9.gif)

1. Install dotnet core SDK.

    ![](images/install-gifs/MacOS/10.gif)

1. Run the installer.

    ![](images/install-gifs/MacOS/11.gif)

1. To test if dotnet was installed successfully, execute the command: `dotnet` into your terminal.

    If you see `command not found`, don't worry! Executing `ln -s /usr/local/share/dotnet/dotnet /usr/local/bin` should fix it.

    ![](images/install-gifs/MacOS/12.gif)

1. In Visual Studio Code you should install the following extensions:

  - C# (search for `ms-vscode.csharp`)
  - C# XML Documentation Comments (`k--kato.docomment`)
  - vscode-icons (`robertohuertasm.vscode-icons`)
  
    ![](images/install-gifs/extensions.gif)

Return to the [overview of the macOS install](/guides/installation/macos.html).