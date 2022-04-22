# vimrc
My personal .vimrc preferences and collection of settings. Basically i tried to make a collection that does not need any plugins besides from the features already delivered with VI improved (Vim) so i can use this on almost every server without  installing anything. 

**ATTENTION**: This help contains normal VIM commands and newly added stuff added whith custom .vimrc in a wild mix.  

# Additional help

## Where to place it

usually it should be Placed here:

| Description         | File         |
| ------------------- | ------------ |
| user vimrc file     | $HOME/.vimrc |
| 2nd user vimrc file | ~/.vim/vimrc |

You can use `:version`  in command mode to show what files he is checking. 

```bash
   system vimrc file: "/usr/local/etc/vim/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
  fall-back for $VIM: "/usr/local/etc/vim"
 f-b for $VIMRUNTIME: "/usr/local/share/vim/vim81"
```



##  Moving between windows 

| Command/Schortcurt                                           | Result                                                 |
| ------------------------------------------------------------ | ------------------------------------------------------ |
| CTRL+ w followed by h                                        | split horizontally                                     |
| CTRL + w followed by v                                       | split vertically                                       |
| CTRL+ w followed by < or >                                   | resize horizontally                                    |
| CTRL+ w followed by + or -                                   | resize vertically                                      |
| CTRL + w followed by w                                       | to toggle between open windows and                     |
| CTRL + w followed by h/j/k/l<br />CTRL + w followed by Left/Down/Up/Right arrow | move to the *left/bottom/top/right* window accordingly |
| :q                                                           | close it                                               |



## Tabs

| Command             | Result                                    |
| ------------------- | ----------------------------------------- |
| :tabnew             | new tab                                   |
| ,t                  | new tab with explorer                     |
| ,T                  | remove complete tab with multiple windows |
| gt<br />CTRL + PgUp | go next tab                               |
| gT<br />CTRL + PgDn | go previous tab                           |
| {i}gt               | got to tab number {i}                     |

## Clipboad 
| Command             | Result                                    |
| ------------------- | ----------------------------------------- |
| "+y                 | copy to clipboard                         |
| "*y                 | copy to middle mouse button               |
| "+p                 | paste from clipboard                      |
| "*p                 | paste from middle mouse button            |

### Add support permanently 
As mentioned below there are systems whithout a clippboard. Thats the reason why i did not add this permanantly to my vimrc.
```
set clipboard=unnamedplus
" or
set clipboard=unnamed
```
Depending on what clipboard you want to use.

### Does my VOM support Clipboard?
If you wants to know if your VIM supports cipboard:
```
vim --version | grep clip
```

### No clipboard system
The clipboard sytem on linux/Unix machines is handled by the Xserver, So if your Server has no X11 System you have to rely on the copy and paste capability of your terminal application. Always remember that if you hold CTRL and select whith your mouse you get into blocksekection mode.(sometimes it's CRTL+ALT)  

In Putty (Windows to Linux), you can highlight the text in the tty by holding the left mouse button down, then clicking the right mouse button (without lifting the left button). Then you can paste it anywhere you want. 

# PHP

Several links concerning PHP and VIM

- [Info about autocomplete on stackoverflow](https://stackoverflow.com/questions/9863706/php-autocomplete-with-vim)
- [Vim for PHP: The Complete Guide for a Powerful PHP IDE](https://thevaluable.dev/vim-php-ide/)
- https://www.simplified.guide/vim/auto-complete-php




