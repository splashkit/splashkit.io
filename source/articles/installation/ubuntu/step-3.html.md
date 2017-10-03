---

title: Installing the SplashKit SDK
step: 3
tags: installation,ubuntu

---

Once you have [installed the pre-requisite packages](/articles/installation/ubuntu/step2.html), you can
install the SplashKit library.

1. Open up a terminal.

    ![Opening a terminal in Ubuntu](images/install-gifs/Ubuntu/open-terminal.gif)

2. Execute the SplashKit library installation script.

    Copy and paste the code below into your terminal and press enter.

    ```bash
    bash <(curl -s https://raw.githubusercontent.com/splashkit/skm/master/install-scripts/skm-install.sh)
    ```

    ![Installing SplashKit library](images/install-gifs/Ubuntu/install-splashkit.gif)

    When asked if you have installed the depenencies, type "Y" and press enter.

3. Add SplashKit to your PATH environment variable.

    Copy and paste the code below into your terminal and press enter.

    ```bash
    echo -e "\n#SplashKit Library Path\nPATH=\"$HOME/.splashkit/skm-linux-x64:$HOME/bin:$PATH\"" >> ~/.profile
    ```

4. Restart your computer.

    To finalise the installation of SplashKit, you need to restart your computer.

    After your computer has reset, log back in and proceed to step five.

5. Open up a terminal.

    ![Opening a terminal in Ubuntu](images/install-gifs/Ubuntu/open-terminal.gif)

6. Confirm your installation was successfull.

    Enter the code below into your terminal and press enter. If your installation
    succeeded, a window should open taking you to the SplashKit home page.

    ```bash
    skm
    ```

Once you have completed the installation of SplashKit, move on to the
[next step - Install Visual Studio Code](/articles/installation/ubuntu/step4.html)

Return to the
[overview of the Ubuntu Linux install](/articles/installation/ubuntu.html).

