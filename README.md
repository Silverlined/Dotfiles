# Dotfiles

## Install

Clone into `$HOME`

`git clone https://github.com/Silverlined/Dotfiles.git`

Run `stow */` to symlink everything or select what is needed

`stow */`

`stow nvim`

## Programs

A list of all programs installed on my Fedora/Arch machine can be found in the `programs` directory

### Install custom .sty files

1. (After stow)  Create a soft link to the .sty file

e.g.
```sh
cp -RP ~/.texmf/folder/ /usr/share/texlive/texmf-dist/tex/
```
where 'folder' contains the .sty file

2. sudo texhash /usr/share/texlive/texmf-dist 

3. sudo apt install texlive-xetex
