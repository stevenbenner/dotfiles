# set xdg user directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# global exports
export PAGER='less'
export EDITOR='nano'
export LANG='en_US.UTF-8'
export LC_COLLATE='C'

# set location of zsh config
# shellcheck disable=SC2034
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
