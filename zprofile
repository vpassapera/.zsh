# If you come from bash you might have to change your $PATH.

export ZSH=$HOME/.oh-my-zsh

#COMPLETION_WAITING_DOTS="true"
plugins=(command-not-found gem git-flow git-extras pip sudo vagrant)

if [ -f /usr/bin/tmux ] || [ -f /usr/local/bin/tmux ]; then
    ZSH_TMUX_AUTOSTART_ONCE=true
    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOCONNECT=false
    plugins+=('tmux')
    plugins+=('tmuxinator')
fi

ZSH_THEME="candy-alt/candy-alt"
ENABLE_CORRECTION="true"

source $HOME/.zsh/.submodules/git-hub/.rc
source $ZSH/oh-my-zsh.sh
source $HOME/.zenv
source $HOME/.zaliases
source $HOME/.zfunctions

if [ -c /etc/bash_completion.d/climate_completion ]; then
    source /etc/bash_completion.d/climate_completion
fi

setopt nosharehistory
