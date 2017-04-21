. $HOME/.zsh/.submodules/zsh-git-prompt/zshrc.sh

function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  DETAILS=" "
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [ "$GIT_BEHIND" -ne "0" ]; then
      DETAILS="$DETAILS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND%{${reset_color}%} "
  fi
  if [ "$GIT_AHEAD" -ne "0" ]; then
      DETAILS="$DETAILS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD%{${reset_color}%} "
  fi

  if [ "$GIT_STAGED" -ne "0" ]; then
      DETAILS="$DETAILS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%} "
  fi
  if [ "$GIT_CONFLICTS" -ne "0" ]; then
      DETAILS="$DETAILS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%} "
  fi
  if [ "$GIT_CHANGED" -ne "0" ]; then
      DETAILS="$DETAILS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%} "
  fi
  if [ "$GIT_UNTRACKED" -ne "0" ]; then
      DETAILS="$DETAILS$ZSH_THEME_GIT_PROMPT_UNTRACKED$GIT_UNTRACKED%{${reset_color}%} "
  fi

    while [ "$DETAILS" != "${DETAILS# }" ]
    do
        DETAILS="${DETAILS# }"
    done

  if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
      echo "$DETAILS$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
      echo "$DETAILS$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_BOX$ZSH_THEME_GIT_PROMPT_PREFIX%{$fg_bold[white]%}${ref#refs/heads/}%{$reset_color%} $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_BOX="%{$fg[white]%}[%{$fg_bold[green]%}%{$reset_color%}%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}%{$fg[blue]%}"

ZSH_THEME_GIT_PROMPT_STAGED="S:"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="U:"
ZSH_THEME_GIT_PROMPT_BEHIND="↓:"
ZSH_THEME_GIT_PROMPT_AHEAD="↑:"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?:"

PROMPT=$'%{$fg[blue]%}%D{[%X]} %{$fg[green]%}[%n@%m]%{$reset_color%} %{$fg[white]%}%~%{$reset_color%} $(git_prompt_info) %{$fg[blue]%}→%{$fg_bold[blue]%} %{$reset_color%} '
