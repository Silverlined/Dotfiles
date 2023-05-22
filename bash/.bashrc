# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias python='python3'
alias python_="python3 -c \"import numpy as np; import code; code.interact(local=locals())\""
alias vpn="sudo openvpn --config /etc/openvpn/client/new-vpn.ovpn"
alias wifi="nmcli device wifi show"
alias lv="lvim"
#alias lsusb='ls -c /dev/bus/usb/004/0*'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

stty werase \^H
export PYTHONPATH="/usr/local/lib/python3/dist-packages/"
export GTK_THEME=Default
export PATH="$PATH:/usr/local/go/bin"

# FZF binding
source /usr/share/doc/fzf/examples/key-bindings.bash


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#ulimit -c unlimited
#echo 'core' | sudo tee /proc/sys/kernel/core_pattern


## Search in files:
wfind() {
    grep -rnw './' -e "$1"
}

### STRF
export ST_DATADIR=$HOME/git/strf
export ST_COSPAR=$ST_DATADIR/data/sites.txt
export ST_TLEDIR=$ST_DATADIR/data/tle

# Filename convention: {TLE_DIR}/{observation_id}.txt
export SATNOGS_TLE_DIR=$ST_DATADIR/data/tles

# absulute frequency measurement storage
# Filename convention: {OBS_DIR}/{observation_id}.txt
export SATNOGS_OBS_DIR=$ST_DATADIR/data/obs

# SATTOOLS/STRF/STVID sites.txt file
export SATNOGS_SITES_TXT=$ST_DATADIR/data/sites/sites.txt

export SATNOGS_NETWORK_API_URL="https://network.satnogs.org/api/"
export SATNOGS_DB_API_URL="https://db.satnogs.org/api/"
export SATNOGS_DB_API_TOKEN="6c37e1791726d6398025bcccdb5eb85a9d41570c"

export GS_ID="platform-flatsat"
export GNUR_ENABLE="true"
export GS_NETWORK_TYPE="GNURADIO"
export GNUR_SCRIPT="BLADERF_RX_TX.py"
#source ~/.git-prompt.sh
#ulimit -c unlimited
sudo sysctl -w net.core.wmem_max=2500000 > /dev/null 2>&1

# NPM
#export PATH="$PATH:$(npm config get prefix)/bin"
