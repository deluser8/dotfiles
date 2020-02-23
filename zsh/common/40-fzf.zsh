function sfp() {
    ag --nobreak --nonumbers --noheading . | fzf | awk -F: '{print $1}'
}

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --silent -g .'

# Now fzf (w/o pipe) will use fd instead of find
# fzf

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
