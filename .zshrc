# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time time)
POWERLEVEL9K_TIME_FORMAT="%D{%I:%M:%S %p}"
DEFAULT_USER="jay"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose httpie zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

# Global aliases
globalias() {
   if [[ $LBUFFER =~ '[A-Za-z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# Unbind all oh-my-zsh aliases
unalias -m '*'

alias -g T='| tail'
alias -g G='| grep'

# Aliases
alias ls='ls -G'
alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
alias ezl='vim ~/.zshrc.local'
alias vi='vim'
alias grep='grep --color=auto'
alias tmux='tmux -2'
alias g='git'
alias gp='git pull'

# Where it gets saved
HISTFILE=~/.history

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

setopt NO_BEEP

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt NO_SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

LOCALZSHRC=~/.zshrc.local && test -f $LOCALZSHRC && source $LOCALZSHRC

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

if (( $+commands[dinghy] )); then
	$(dinghy shellinit)
fi

