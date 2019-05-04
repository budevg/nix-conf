eval "$(dircolors -b ~/.dircolors)"

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias gstack='stack --resolver global'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

alias s='ssh -q -X -l root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sr='ssh -q -X -l root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa'
alias sc='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias sudo='sudo env PATH=$PATH'
alias d='docker -H unix://$HOME/scratch/docker.sock'
alias v='vnc-mon.sh'
alias gstack='stack --resolver global'

PATH=$HOME/.local/bin:$HOME/tools/bin:$PATH
export TMPDIR=$HOME/scratch

export PS1="\u@\h:\w\$ "
export NIX_PATH="$NIX_PATH:nixpkgs-overlays=$HOME/.nixpkgs/overlays"
