It currently has a slow startup (less than 2 seconds on my machine),
due to the program having to self-extract before executing itself.

I was unable to successfully manually run ClickUp after running
--appimage-extract. It is looking for specific files such as
linked libraries that are from the extract content but is unable to find them.

Those missing libraries though are inside /squashfs-root/usr/lib, and referenced
by the LD_LIBRARY_PATH environment variable set by /squashfs-root/AppRun.

Feel free to help me and look around the attempt hosted here:
https://gist.github.com/NyanKiyoshi/40498ef1ae0bc3b5d186c0e2f26684d9#file-dockerfile

/squashfs-root/AppRun (sh) file is included in the gist as well.
