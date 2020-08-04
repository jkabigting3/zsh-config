# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time virtualenv)

# Autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# local user_symbol="$"
# if [[ $(print -P "%#") =~ "#" ]]; then
#     user_symbol = "#"
# fi

DEFAULT_USER=$(whoami)
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github colorize colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

## never ever beep ever
setopt NO_BEEP

# # Directory info.
local current_dir='${PWD/#$HOME/~}'

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

fpath=(/usr/local/share/zsh-completions $fpath)
rm -f ~/.zcompdump; compinit -u

# Load my aliases/functions:
. ~/.aliases
. ~/.functions

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin:$HOME/bin
export PATH

export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:$HOME/.npm-global/lib/node_modules
