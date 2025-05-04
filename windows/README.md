# Introduction
This markdown file is just to document my Windows setup in case I need to restore it at some point.

I don't use Windows enough to do a more serious setup with WSL so I usually just used to install Git Bash in the past. Since that was what I was used to installing I wanted to add a simple theme and a better Terminal around it for the occasional times that I am using my Windows system. 

# Setup
After installing Git Bash like I normally do I started by switching to the new Windows Terminal. I had to create Git Bash profile for myself because it did not make one automatically.

I installed Neovim and added aliases for vi and vim to nvim to my .bashrc profile.

Finally, I installed the [powerline-shell](https://github.com/b-ryan/powerline-shell) theme. I used pip to install it after installing Python 3.13. 

Then I added it ~/.bashrc after which I ran into some issues with Windows Terminal that I needed to make changes to.

## Changes to the Windows Terminal Settings
In order to fix a Python error about character mappings I had to make some changes here. I had to set the encoding for the Windows Terminal profile to utf-8.

I did this by adding it to json settings file from the Windows Terminal settings. I could not figure out how to set it in Windows Terminal settings GUI.

And finally I had to download the PL version of the font. I ended up using Cascadia Code PL which I found [here](https://github.com/microsoft/cascadia-code/releases). I installed the TTF file inside the zip and set it in the Profile settings under Appearance -> "Font Face"

Finally, I had to set LANG, LC_ALL, and PYTHONIOENCODING in the .bashrc file.

There was one last issue in which because the ps command in Git Bash wasn't quite POSIX compliant it gave 4 lines of output with an error about every time ps -o was used by powerline-shell. After some investigation I found this was caused by the jobs segment. My solution for now was to simply disable the jobs segment in .powerline-shell.json, although I could probably fix this one day by switcing to WSL.



