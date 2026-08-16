#############################################
############# HISTORY CONFIG ################
#############################################
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=$HISTSIZE

#############################################
############# EXPORT ########################
#############################################
export GH_EDITOR=nvim


setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

#############################################
############### ALIAS CONFIG ################
#############################################
alias zshrc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"

#############################################
############ UPDATEING PATHS   ##############
#############################################
MY_SCRIPT_PATH="$HOME/dotfiles/scripts"

if [[ ":$PATH:" != *":$MY_SCRIPT_PATH:"* ]]; then
  export PATH="$MY_SCRIPT_PATH:$PATH"
fi
#############################################
############ ZSH CONFIG LOADER ##############
#############################################
ZSH_CONFIG_DIR="$HOME/.config/zsh"

for config_file in $ZSH_CONFIG_DIR/*.zsh; do
  source "$config_file"
done

for modules_file in $ZSH_CONFIG_DIR/modules/*.zsh;do
  source "$modules_file"
done
