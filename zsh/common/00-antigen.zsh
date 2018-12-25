# load the oh-my-zsh's library
antigen use oh-my-zsh
echo ZSH_CUSTOM
echo $ZSH_CUSTOM
echo ZSH_CUSTOM
antigen bundles <<EOF
    colored-man-pages
    colorize
    docker
    docker-compose
    extract
    git
    httpie
    sudo
    tmux
    z
    copyfile
    encode64
    urltools

    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    soimort/you-get

    $ZSH_CUSTOM/plugin/fzf
EOF
# command-not-found
#    $ZSH_CUSTOM/plugin/thefuck
# load the theme
antigen theme candy
