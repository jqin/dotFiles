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
plugins=(git zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

# Unbind all oh-my-zsh aliases
unalias -m '*'

# Aliases
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
setopt APPEND_HISTORY       # Don't overwrite, append!
setopt INC_APPEND_HISTORY   # Write after each command
setopt NO_SHARE_HISTORY     # Killer: share history between multiple shells
setopt HIST_IGNORE_DUPS     # If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_ALL_DUPS # Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE    # If a line starts with a space, don't save it.
setopt HIST_NO_STORE
unsetopt NOMATCH            # no error if glob fails to expand

LOCALZSHRC=~/.zshrc.local && test -f $LOCALZSHRC && source $LOCALZSHRC

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

