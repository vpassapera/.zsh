# If you come from bash you might have to change your $PATH.

export ZSH=$HOME/.oh-my-zsh

#COMPLETION_WAITING_DOTS="true"
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
ZSH_THEME="candy-alt/candy-alt"
ENABLE_CORRECTION="true"
plugins=(command-not-found gem git-flow git-extras pip sudo vagrant tmux tmuxinator)

source $HOME/.zsh/.submodules/git-hub/.rc
source $ZSH/oh-my-zsh.sh
source $HOME/.zenv
source $HOME/.zaliases
source $HOME/.zfunctions

if [ -c /etc/bash_completion.d/climate_completion ]; then
    source /etc/bash_completion.d/climate_completion
fi

setopt nosharehistory
