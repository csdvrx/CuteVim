# CuteVim in pictures

There's both a light and dark mode:
![screenshot of vim in dark mode inside wezterm over vim in light mode inside foot](screenshots/cute-vim.png)

You can move the current line by holding the Alt key, and quickly change the appearance with the F8/F9/F10 keys:
![recording of vim in light mode using alt arrows to move the current line, then f8 f9 f10 to change the appearance](screenshots/alt-keys-f8-f9-10.mp4)

You can also move blocks of text by selecting a range (first hold the Shift key then use the arrows) which can then be moved around by holding both Control and Shift and using the arrow keys:
[!recording of vim in light mode using ctrl shift arrows to move a block of text](screenshots/shift-arrows_then_ctrl-shift.mp4)

# What is CuteVim?

CuteVim is a minimal configuration file (TODO: it's not all included in .vimrc yet) to give sensible defaults to Vim, like:

 - a tabline on top, showing the filename and ISO timestamp, the encoding (with the unicode byte-order-mark if applicable), the position in a (x=column, y=row) space with the hexadecimal value of the character you see and the position within the file in box hexadecimal and percentage

 - a line counter on the left, with both the current line number (hilighted and underlined to quickly see it) and the relative line numbers (dimmer) to type vim commands that apply to a length in lines (like `:d5` to delete the next 5 lines)

 - saving backups of files in ~/.vim/backup every time you save, and keeping an undo-per file

 - restoring the cursor position to where you last edited the file

 - selecting lines with the shift keys and the arrows

 - moving lines, blocks of lines or words with Alt and the arrows, and text or blocks of text with Ctrl-Shift and the arrows

 - having separate functions for Control keys and their results, for example to separate Tab (which indent the current line) and Ctrl-I (which jumps the cursor position following the edit history, best used with Ctrl-O) thanks to [xterm 'modifyotherkeys' (MOK)](https://invisible-island.net/xterm/modified-keys.html)

 - showing otherwise invisible characters (like tabs and control codes, or spaces on empty lines) using colors to avoid breaking copy-paste

 - playing ball with Wayland by having one shared copy-paste buffer

 - overriding dark themes to replace the uggly muddy darkgreys by a pure #000000 black: this is ideal on OLED screens which can do pitchblack and give you a higher constrast

# Are these defaults really sensible?

If you don't like readline or Windows shortcuts, some of my choices may be questionable.

Fortunately, the .vimrc should be easy to understand thanks to all the comments, and you should be able to adjust it to match your preferences.

PS: If you don't have an OLED screen, don't comment out `autocmd ColorScheme * call OLED_Black()` around line 1162. Instead, go buy an OLED screen! It's really worth it!!

# How can I quickly change the apperance?

Press F8 to show hidden characters, F9 to cycle through the themes, F10 to toggle the rainbow indent

The .vimrc is made to recognize which terminal you are using, and start in either a light or dark profile: I use both foot (light) and wezterm (dark).

If you use Windows Terminal, you can also configure UUIDs to recognize the profile

# Why are the Control keys mapped to emacs-like readline commands?

Because I feel bad when Ctrl-A doesn't get me to the beginning of the line, and Ctrl-E to the End.

I like it better when Ctrl-K also cuts from the cursor to the end of the line, and Ctrl-U to the beginning.

I'm fully happy when all the Ctrl keys "work as they should", like:

 - if Control-Arrows can jump around words and lines,

 - while both Ctrl-W and Ctrl-Backspace removes the previous word,

 - and both Ctrl-S and Ctrl-Delete remove the next word

I often have different shortcuts to do the same thing because I'm whimsical and I like to use one or the other depending on the mood :)

# Why can't I do copy-paste in Xorg?

I use Wayland (to be precise, [the best composer of all for a keyboard centric workflow: hyprland](https://github.com/hyprwm/Hyprland)) so Xorg is not well tested.

I will try add other functions for Xorg if the defaults don't work.

# Why make CuteVim?

I wanted to have a cute editor for [☪ ☮$m✡✝🍏linux](http://github.com/csdvrx/cosmopolinux) without having to carry too many files around, because I sometimes forget to take them in a tarball or a zip file.

So CuteVim configuration mostly fit within .vimrc, the one file I will not forget to take!

CuteVim still depends on ~/.vim/after/syntax for italics within .vim files, and ~/.vim/colors for the [default Solarized theme](https://en.wikipedia.org/wiki/Solarized), but I'll try to eventually fit everything inside the .vimrc (or at least switch to a default vim there if missing ~/.vim/colors/solarized*.vim)
