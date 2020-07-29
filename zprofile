# If you come from bash you might have to change your $PATH.

export ZSH=$HOME/.oh-my-zsh

#COMPLETION_WAITING_DOTS="true"
plugins=(
  command-not-found
  gem
  git-flow
  git-extras
  pip
  sudo
  vagrant
  zsh-syntax-highlighting
  zsh-autosuggestions
)

if [ -f /usr/bin/tmux ] || [ -f /usr/local/bin/tmux ]; then
    ZSH_TMUX_AUTOSTART_ONCE=true
    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOCONNECT=false
    plugins+=('tmux')
    plugins+=('tmuxinator')
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

if [ -f $HOME/.zsh/zprofile.local ]; then
  source $HOME/.zsh/zprofile.local
fi

source $HOME/.zsh/zextras
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time os_icon virtualenv context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history background_jobs custom_vagrant_status custom_symfony_status)
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

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)

