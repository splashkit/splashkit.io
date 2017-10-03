---

title: Ensuring your version of Ubuntu is supported
tags: installation,ubuntu

---

# Check that your version of Ubuntu is supported

SplashKit requires Ubuntu version 16.04 or greater to operate without
manual intervention.

To check which version of Ubuntu you are running, follow the steps below.

1. Open up a terminal.

    ![Opening a terminal in Ubuntu](images/install-gifs/Ubuntu/open-terminal.gif)

2. Check your Ubuntu version

    Copy and paste the code in the box below into your terminal and press enter.

    ```bash
    lsb_release -a
    ```

    ![Executing lsa-release -a](images/install-gifs/Ubuntu/check-version.gif)

3. Compare your version with the supported version

    Check your release version by reading the "Release:" line presented.

    If your version is greater than or equal to 16.04, your version is supported.

    ![Checking verison compatibility](images/install-gifs/Ubuntu/interpret-version.jpg)

Once you have confirmed that your version is supported, move on to the
[next step - Install pre-requisites for SplashKit](/articles/installation/ubuntu/step2.html).

Return to the
[overview of the Ubuntu Linux install](/articles/installation/ubuntu.html).
