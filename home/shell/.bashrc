eval "$(dircolors -b ~/.dircolors)"

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias gstack='stack --resolver global'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

alias s='ssh -q -X -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sr='ssh -q -X -l root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sc='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias sudo='sudo env PATH=$PATH'
alias d='docker -H unix://$HOME/scratch/docker.sock'
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'
alias v='vnc-mon.sh'
alias gstack='stack --resolver global'
alias nix='TERM=xterm nix'

PATH=$HOME/.local/bin:$HOME/tools/bin:$PATH
export TMPDIR=$HOME/scratch

export GOPATH=$TMPDIR/.go
export GOCACHE=$TMPDIR/.go-build

export PS1="\u@\h:\w\$ "

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi
