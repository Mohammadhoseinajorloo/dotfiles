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
alias taskv2="python3 ~/task.py"


#############################################
############### FLOW ALIAS CONFIG ###########
#############################################
alias fs="flow start"
alias fd="flow done"
alias fcl="flow clean"
alias fstat="flow status"

#############################################
############ UPDATEING PATHS   ##############
#############################################
MY_SCRIPT_PATH="$HOME/dotfiles/.scripts"

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

# Android SDK (APT version)
export ANDROID_HOME=/usr/lib/android-sdk
export ANDROID_SDK_ROOT=/usr/lib/android-sdk

export PATH=$PATH:/usr/lib/android-sdk/platform-tools
export PATH=$PATH:/usr/lib/android-sdk/tools
export PATH=$PATH:/usr/lib/android-sdk/tools/bin

# Add all build-tools versions
for dir in /usr/lib/android-sdk/build-tools/*; do
  export PATH=$PATH:$dir
done


# GapCode
export PATH="/home/mohammad/.gapcode/bin:$PATH"
