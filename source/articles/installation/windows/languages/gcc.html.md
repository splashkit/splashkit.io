---

title: Installing GCC on Windows
tags: installation,windows,clang

---

1. Open an MSYS2 terminal
1. Run the following command:

    `pacman --disable-download-timeout -S mingw-w64-{x86_64,i686}-gcc mingw-w64-{i686,x86_64}-gdb`

    ![](images/install-gifs/Windows/install-gpp-msys.gif)

1. Run the compiler from either the **MSYS2 MinGW 64-bit** or **MSYS2 MinGW 32-bit** terminals

    ![](images/install-gifs/Windows/demo-compiler.gif)

1. In Visual Studio Code you should install the following extensions:

  - C++ (search for `ms-vscode.cpptools`)
  - vscode-icons (`robertohuertasm.vscode-icons`)

    ![](images/install-gifs/extensions.gif)

Return to the [overview of the windows install](/articles/installation/windows).
