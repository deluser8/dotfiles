# load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundles <<EOF
    command-not-found
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
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    soimort/you-get
EOF

# load the theme
antigen theme candy
