# Introduction
This markdown file is just to document my Windows setup in case I need to restore it at some point.

I currently don't use WSL on Windows. I usually just installed Git Bash in the past. So for the time being I just wanted to improve my experience with a better terminal application and theme. I may one day try to switch to WSL but I currently don't really use Windows enough to justify adding it.

# Setup
After installing Git Bash like I normally do I started by switching to the new Windows Terminal. I had to create the profile in Windows Terminal for Git Bash myself because it did not make one automatically. I then set it as the default profile at startup and switched it to using %USERPROFILE% as the Starting Directory because otherwise it started in C:\Windows\System32.

I installed Neovim and added aliases for vi and vim to nvim to my .bashrc profile.

Finally, I installed the [powerline-shell](https://github.com/b-ryan/powerline-shell) theme. I used pip to install it after installing Python 3.13. 

Then I added it to my bashrc following the README. This is where I ran into some issues with the Windows Terminal and had to do some research and change some settings.

## Changes to the Windows Terminal Settings
In order to fix a Python error about character mappings I had to make some changes here. I had to set the encoding for the Windows Terminal profile to utf-8.

I did this by adding it to the json settings file from the Windows Terminal settings. I could not figure out how to set it in Windows Terminal settings GUI.

I also had to change to a font that had the Powerline glyphs. I ended up using Cascadia Code PL which I found [here](https://github.com/microsoft/cascadia-code/releases). I installed the TTF file inside the zip and set it in the Profile settings under Appearance -> "Font Face"

I discovered I had to set LANG, LC_ALL, and PYTHONIOENCODING in the .bashrc file. I won't go into that anymore since they are in the file.

There was one last issue in which because the ps command in Git Bash wasn't quite POSIX compliant and it gave 4 lines of output with an error about every time ps -o was used by powerline-shell. After some investigation I found this was caused by the jobs segment. My solution for now was to simply disable the jobs segment in .powerline-shell.json, although I could probably fix this one day by switcing to WSL.

