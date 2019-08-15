---

title: Installing the SplashKit Manager
tags: installation,linux

---

1. Open up a terminal.

    ![Opening a terminal in Linux](images/install-gifs/Ubuntu/open-terminal.gif)

2. Ensure you have **curl** and **git** installed, these are used in the SplashKit install process.

    Install using your package manager. For example:

    ```bash
    sudo apt-get install curl git
    ```

3. Install the SplashKit Manager

    Copy and paste the code in the box below into your terminal and press enter.

    ```bash
    bash <(curl -s https://raw.githubusercontent.com/splashkit/skm/master/install-scripts/skm-install.sh)
    ```

4. Restart the terminal and execute `skm` to test it was successfully installed. 

    ```bash
    skm
    ```

    You should see the following messages:

    ```bash
    Splashkit is installed successfully!
    Missing skm command. For help use 'skm help'
    ```

Return to the
[overview of the Linux install](/articles/installation/ubuntu).
