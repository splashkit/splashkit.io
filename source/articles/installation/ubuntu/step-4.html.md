---

title: Installing Visual Studio Code
tags: installation,ubuntu

---

Once you have the [installed SplashKit library](/articles/installation/ubuntu/step3.html) you
can download and install Visual Studio Code to use as a source code editor.

1. Download [Visual Studio Code](https://code.visualstudio.com/)

    ![Downloading Visual Studio Code for Ubuntu](images/install-gifs/Ubuntu/download-vsc.gif)

2. Open up a terminal.

    ![Opening a terminal in Ubuntu](images/install-gifs/Ubuntu/open-terminal.gif)

3. Install Visual Studio Code

    In the terminal window, change directory using the ```cd``` command to the
    directory where Visual Studio Code downloaded

    ```
    cd ~/Downloads
    ```

    Then, install the .deb package by copying and pasting the code below into
    your terminal and pressing enter.

    ```
    sudo dpkg -i code_1.*.deb
    ```

    ![Installing Visual Studio Code on Ubuntu](images/install-gifs/Ubuntu/install-vsc.gif)

Return to the
[overview of the Ubuntu Linux install](/articles/installation/ubuntu).
