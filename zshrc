[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES=$HOME/.dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh
source $ZSH_CUSTOM/antigen.zsh

# load all common configurations
for config_file ($ZSH_CUSTOM/common/*.zsh(N)); do
  source $config_file
done
unset config_file

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lancer/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lancer/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lancer/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lancer/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[[ -s "/home/lancer/.gvm/scripts/gvm" ]] && source "/home/lancer/.gvm/scripts/gvm"
