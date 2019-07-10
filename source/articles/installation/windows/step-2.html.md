---

title: Installing the SplashKit SDK
tags: installation,windows

---

Once you have MSYS2 installed, you can install the SplashKit library:

1. In your MSYS2 Terminal, paste and run the following line

    `bash <(curl -s https://raw.githubusercontent.com/splashkit/skm/master/install-scripts/skm-install.sh)`.

    This can also be found on the [splashkit](http://www.splashkit.io).

    ![](images/install-gifs/Windows/6.gif)

1. Restart the terminal and execute `skm` to test it was successfully installed.

    ```bash
    skm
    ```

    You should see the following messages:

    ```bash
    Splashkit is installed successfully!
    Missing skm command. For help use 'skm help'
    ```

    SplashKit supports a number of languages. Run `skm help` at the terminal to see the different commands you can run.



[Next - Install Visual Studio Code](/articles/installation/windows/step-3.html)

Return to the [overview of the windows install](/articles/installation/windows).
