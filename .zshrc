export DOTFILES=$HOME/dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh
source $ZSH_CUSTOM/antigen.zsh

# load all common configurations
for config_file ($ZSH_CUSTOM/common/*.zsh(N)); do
  source $config_file
done
unset config_file

# load extra configurations
# test -e "${HOME}/.extra" && source "$HOME/.extra"

# apply antigen configurations
# remember that all configurations above will be cached
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
