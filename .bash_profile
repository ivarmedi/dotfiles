## start profile 
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" 
## end profile

export OS=$(uname -s)

__git_ps1() {
  return 0
}

# Source
if [ -d /usr/local/etc/bash_completion.d ]; then
  for f in /usr/local/etc/bash_completion.d/*; do
    . "$f"
  done
fi
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## alias
alias tolower="tr [':upper:'] [':lower:']"
alias toupper="tr [':lower:'] [':upper:']"
alias vi=vim
alias steam_wine="wine 'C:\Program Files (x86)\Steam\Steam.exe'"

if [ "$OS" == "Darwin" ]; then
  alias ls='ls -G'
elif [ "$OS" == "Linux" ]; then
  alias ls='ls --color=auto'
fi

ssh() {
  str=$(echo $@|awk '{print $NF}')

  [ -n "$TMUX" ] && tmux rename-window -t${TMUX_PANE} "$str"
  command ssh "$@"
  [ -n "$TMUX" ] && tmux set-window-option -t${TMUX_PANE} automatic-rename "on"
}

shopt -s histappend
export HISTFILESIZE=5000 HISTSIZE=5000 HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
export PATH="$PATH:$HOME/.rvm/bin"
export EDITOR=vim

# prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\[\e[1;32m\]\u@$(hostname) \[\e[31m\]\w\[\e[97m\]$(__git_ps1)\[\e[0m\]]\$ '
