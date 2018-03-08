---

title: Installing the .NET Core SDK on macOS
tags: installation,mac,dotnet

---

This guide assists with installing the [.NET Core SDK](https://microsoft.com/net/core) on macOS.

1. Firstly, we need to install the [Homebrew Package Manager](https://brew.sh).
   Copy and paste the command given on the website into your terminal.

    ![Installing Homebrew](images/install-gifs/mac/install-brew.gif)

    You will need to enter in your password into the terminal to install
    Homebrew. Whilst you may type into the keyboard, no password characters
    will appear for security reasons.

1. Now use `brew` from your terminal to to install the .NET Core SDK:

    ```bash
    $ brew cask install dotnet-sdk
    ```

    You will also need to link the `dotnet` command into `/usr/local/bin`:

    ```bash
    $ ln -s /usr/local/share/dotnet/dotnet /usr/local/bin
    ```

1. To test if the .NET Core was installed successfully, see if the `dotnet` command exists.

    ```
    $ dotnet
    ```

    If you're seeing `command not found`, you may you can execute the following command
    to fix it:

    ```bash
    $ ln -s /usr/local/share/dotnet/dotnet /usr/local/bin
    ```

    ![Known issues with dotnet install](images/install-gifs/mac/dotnet-known-issues.gif)

    Should you have any other installation issues, review the .NET core [release notes](https://github.com/dotnet/core/tree/master/release-notes)
    or raise an issue on [GitHub](https://github.com/splashkit/splashkit-macos/issues).

1. In Visual Studio Code you should install the following extensions:
    - [C#](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp)
    - [C# XML Documentation Comments](https://marketplace.visualstudio.com/items?itemName=k--kato.docomment)
    - [vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons)

    You can do this from the command line by executing:

    ```bash
    code --install-extension ms-vscode.csharp
    code --install-extension k--kato.docomment
    code --install-extension robertohuertasm.vscode-icons
    ```

    You can also search for them by opening up the extensions panel.
    You can use the <kbd>⌘+x</kbd> to open the panel. Then search for the name
    and click install:

    ![Installing VSCode C# Extensions](images/install-gifs/extensions.gif)

Return to the [overview of the macOS install](/articles/installation/mac).
