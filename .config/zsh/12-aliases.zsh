compdef _ssh color-ssh=ssh
alias la='exa -ag@'
alias l='exa -gGF --git --color-scale'
alias ll='exa -lg@a --git --color-scale'
alias ls='ls --color'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias grep='grep --color=auto'
alias keepass='source ~/.ssh-agent.conf && keepass'
alias bubu='bb-wrapper -Syu --aur'
alias ssh=color_ssh
alias less='less -m -g -i -J --underline-special'
alias more='less'
alias cat="highlight $1 --out-format xterm256 --quiet --force --style solarized-light"
alias bat='batcat'
alias fd ='fdfind'
alias ag='/usr/bin/ag'
