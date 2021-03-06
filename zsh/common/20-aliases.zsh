# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

alias cask='brew cask'
alias hosts='sudo $EDITOR /etc/hosts'

alias ag='ag -f --hidden'

alias gch='git clone --depth=1'

# use coreutils `ls` if possible…
hash gls >/dev/null 2>&1 || alias gls="ls"

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# proxychains
if [ $commands[proxychains4] ]
then
    alias p=proxychains4
elif [ $commands[proxychains] ]
then
    alias p=proxychains
fi

# Networking. IP address, dig, DNS
if [ $commands[dig] ]; then
    alias ipglobal="dig +short myip.opendns.com @resolver1.opendns.com"
else
    alias ipglobal="curl -q myip.ipip.net 2>/dev/null | awk -F'：' '{print \$2}' | awk '{print \$1}'"
fi

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

# Shortcuts
alias ungz="gunzip -k"
alias tailf="tail -f"

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias clean-docker-container='docker ps -aq | xargs docker rm'
alias clean-docker-image='docker images | grep "^<none>" | awk "{print $3}" | xargs docker rmi'
alias run-ctf-box='docker run -dit --name ctf-box-$(basename $(pwd)) --rm --privileged -p 10022:22 -P -v $PWD:/root/workspace ripples/ctf-box'

alias clear-proxy='unset http_proxy https_proxy'

alias typora="open -a typora"


# python
#
alias py2=python2
alias py3=python3
#alias py="/usr/local/Cellar/python/3.7.7/bin/python3"
#alias py3="/usr/local/Cellar/python/3.7.7/bin/python3"
#alias python3="/usr/local/Cellar/python/3.7.7/bin/python3"


# IPython3

# vim
#alias v=nvim

if [ $commands[nvim] ]
then
    alias v=nvim
elif [ $commands[vim] ]
then
    alias v=vim
fi
## ag
alias agb="ag -A 5 -B 5"
