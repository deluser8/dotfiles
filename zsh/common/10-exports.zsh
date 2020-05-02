# vim as default
export EDITOR="vim"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export PATH=$HOME/bin:$DOTFILES/bin:$DOTFILES/iterm2:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
export MANPATH=/usr/local/share/man:/usr/share/man:/usr/local/man:$MANPATH


# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Set go path
#export GOPATH="${HOME}/.go"
#export PATH="${GOPATH//://bin:}/bin:$PATH"
#
# Set python startup script.
test -e "${HOME}/.pystartup" && export PYTHONSTARTUP="$HOME/.pystartup"

# iTerm2 hostname
export iterm2_hostname=${iterm2_hostname:-${$(hostname -f 2>/dev/null)#lancer-}}



# add scripts path

export PATH=$HOME/tools/scripts:$PATH

# add adb
export PATH=$HOME/AndroidSdkTools/platform-tools:$HOME/AndroidSdkTools/build-tools/28.0.3:$PATH

# 彩色补全菜单
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 补全类型提示分组

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
