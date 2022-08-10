local _c_reset="$reset_color"
local _c_dark="$fg_bold[black]"
local _c_user="$fg_bold[green]"
local _c_host="$fg_bold[yellow]"
local _c_path="$fg_bold[blue]"
local _c_remote="$fg[cyan]"
local _c_git_branch="$fg_bold[magenta]"
local _c_git_dirty="$fg_bold[cyan]"
local _c_prompt="$fg_bold[white]"

local ret_status="%(?::
%{$fg_bold[red]%}%?%s)"
local prompt_char="$(if [ "$UID" -eq "0" ]; then echo '#'; else echo '$'; fi)"

PROMPT='$ret_status
%{$_c_user%}%n%{$_c_dark%} at %{$_c_host%}%m%{$_c_dark%} in %{$_c_path%}${PWD/#$HOME/~}%{$_c_dark%}$(git_prompt_info)
%{$_c_prompt%}$prompt_char %{$_c_reset%}'

RPROMPT=''
if [ ! -z "$SSH_CLIENT" ]; then
  RPROMPT="$RPROMPT  %{${_c_remote}%}REMOTE"
fi

RPROMPT="$RPROMPT%{$_c_reset%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$_c_git_branch%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$_c_reset%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$_c_git_dirty%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
