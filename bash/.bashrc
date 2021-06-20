# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# File system navigation
source /usr/share/fzf/shell/key-bindings.bash
# When selecting files with fzf, we show file content with syntax highlighting,
# or without highlighting if it's not a source file. If the file is a directory,
# we use tree to show the directory's contents.
# We only load the first 200 lines of the file which enables fast previews
# of large text files.
# Requires highlight and tree: pacman -S highlight tree
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||
cat {} || tree -C {}) 2> /dev/null | head -100'"
complete -o bashdefault -o default -F _fzf_path_completion zathura

# User specific aliases and functions
alias pip='pip3'
alias la='ls -A'
alias black='/bin/black'
alias off='xset dpms force off'

alias vi='nvim'
alias vim='nvim'
alias ci3='nvim $HOME/.config/i3/config'
alias viplug='nvim $HOME/.config/nvim/plugins.vim'
alias vimap='nvim $HOME/.config/nvim/mappings.vim'
alias viset='nvim $HOME/.config/nvim/settings.vim'
alias visnippets='nvim $HOME/.config/nvim/tex.snippets'
alias notes='nvim $HOME/.notes.md'
alias vibash='nvim $HOME/.bashrc'
alias sbash='source $HOME/.bashrc'
alias bgkey="setxkbmap -option 'grp:ctrl_shift_toggle' -layout us,bg -variant ,phonetic"
alias i3require="nvim $HOME/.config/i3/requirements.txt"
stty werase \^H
