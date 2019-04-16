---

title: Make the SplashKit Source
tags: installation,linux

---

Once you have
[Installed the SplashKit Manager](/articles/installation/ubuntu/step-1/)
you can build the SplashKit from source.

1. Open up a terminal.

    ![Opening a terminal](images/install-gifs/Ubuntu/open-terminal.gif)

2. CD into SplashKit source

    Copy and paste the code below into your terminal *one-by-one*.

    ```bash
    cd ~/.splashkit/source
    cmake .
    make
    make install
    ```

    You may receive warnings during this process, which can be ignored. However, any errors usually mean you are missing a dependency. Determine which this is, and install it on your districution's package manager.

Return to the
[overview of the Ubuntu Linux install](/articles/installation/ubuntu).
