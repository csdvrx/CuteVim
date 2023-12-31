#!/usr/bin/sh

# clean up
rm -f vim.com
# start from a clean vim ape name vim.com like with:
wget https://cosmo.zip/pub/cosmos/bin/vim -O vim.com
wget https://cosmo.zip/pub/cosmos/bin/zip -O zip.com
wget https://cosmo.zip/pub/cosmos/bin/unzip -O unzip.com
# make it executable
chmod +x vim.com
# .com is needed otherwise zip -r will create a vim.zip

# check the defaults
./vim.com --version | grep usr/share
# fall-back for $VIM: "/zip/usr/share/vim"

# Therefore add the vimrc in usr/share/vim
mkdir -o ./usr/share/vim
cp .vimrc ./usr/share/vim/vimrc
./zip -r vim.com usr/share/vim/vimrc

# Check
./unzip -l vim.com |grep usr/share/vim/vimrc

# To explain the above, use strace to check:
#vim.com --strace 2> vim.strace.txt
#grep zip.usr.share.vim vim.strace.txt |grep defaults.vim | less
#SYS 1646170 1646170         12'999'983 fstatat(AT_FDCWD, "/zip/usr/share/vim/vim90/defaults.vim", [{.st_size=4'952, .st_blocks=2'560/512, .st_mode=0100644, .st_dev=0x172120, .st_ino=0x1097916, .st_blksize=65'536}], 0) → 0 ENOTSUP
#SYS 1646170 1646170         13'032'512 openat(AT_FDCWD, "/zip/usr/share/vim/vim90/defaults.vim", O_RDONLY) → 3 ENOTSUP
# Earlier:
#grep zip.usr.share.vim vim.vanilla.strace.txt |grep vimrc
#SYS 1646170 1646170         12'917'060 fstatat(AT_FDCWD, "/zip/usr/share/vim/vimrc", [n/a], 0) → -1 ENOENT
#SYS 1646170 1646170         12'920'202 openat(AT_FDCWD, "/zip/usr/share/vim/vimrc", O_RDONLY) → -1 ENOENT
# Therefore:
# ./zip -r vim.com usr/share/vim/vimrc
# Running it again, it's seen:
#SYS 1650340 1650340        114'662'106 fstatat(AT_FDCWD, "/zip/usr/share/vim/vimrc", [{.st_size=42'484, .st_blocks=14'848/512, .st_mode=0100644, .st_dev=0x7c98aa, .st_ino=0x10b712f, .st_blksize=65'536}], 0) → 0 ENOTSUP
# 42484 is the filesize, ENOTSUP is because of O_RDONLY

## Prepare other assets:
# italics for comments (python, vimrc)
cp .vim/after/syntax/python.vim usr/share/vim/vimfiles/after/syntax
cp .vim/after/syntax/vim.vim usr/share/vim/vimfiles/after/syntax
# solarized theme
cp .vim/colors/solarized.vim usr/share/vim/vimfiles/colors/
cp .vim/colors/solarized8.vim usr/share/vim/vimfiles/colors/
cp .vim/colors/solarized8_flat.vim usr/share/vim/vimfiles/colors/
cp .vim/colors/solarized8_high.vim usr/share/vim/vimfiles/colors/
cp .vim/colors/solarized8_low.vim usr/share/vim/vimfiles/colors/

# then add them too
./zip -r vim.com usr/share/vim/vimfiles
