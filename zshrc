
export DOTFILES=$HOME/.dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh
source $ZSH_CUSTOM/antigen.zsh

# load all common configurations
for config_file ($ZSH_CUSTOM/common/*.zsh(N)); do
  source $config_file
done
unset config_file


setopt no_nomatch

# apply antigen configurations
# remember that all configurations above will be cached
antigen apply

#load extra configurations
test -e "${HOME}/.extra" && source "$HOME/.extra"
#eval $(thefuck --alias) 
# # enable shell integration only when using iTerm2
# $DOTFILES/bin/isiterm2 && source $DOTFILES/iterm2/shell-integration
# 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias gcd1="git clone --depth=1"

