# create a zkbd compatible hash;
# # to add other keys to this hash, see: man 5 terminfo
typeset -A key
#p_debug=0
#source ssh-find-agent.sh
#ssh_find_agent -a
#if [ "${SSH_AUTH_SOCK:-'set to empty'}" != "set to empty" ]
#then
#  eval $(ssh-agent) > /dev/null
#  ssh-add -l > /dev/null || alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh; ssh'
#fi
# set time a key should be kept in seconds
##keyage=28800
##
##do-ssh-agent() {
##  # function to start the ssh-agent and store the agent details for later logon
##  ssh-agent -s > ~/.ssh-agent.conf 2> /dev/null
##  ssh-add -l > /dev/null || alias ssh='ssh-add -l > /dev/null || ssh-add -t $keyage && unalias ssh; ssh'
##  . ~/.ssh-agent.conf > /dev/null
##}
##
##if [ -f ~/.ssh-agent.conf ] ; then
##  . ~/.ssh-agent.conf > /dev/null
##  ssh-add -l > /dev/null 2>&1
##  # $?=0 means the socket is there and it has a key
##  # $?=1 means the socket is there but contains no key
##  # $?=2 means the socket is not there or broken
##  stat=$?
##  if [ $stat -eq 1 ] ; then
##    #ssh-add -t $keyage > /dev/null 2>&1
##  elif [ $stat -eq 2 ] ; then
##    rm -f $SSH_AUTH_SOCK
##    do-ssh-agent
##    #ssh-add -t $keyage > /dev/null 2>&1
##  fi
##else
##  do-ssh-agent
##  #ssh-add -t $keyage > /dev/null 2>&1
##fi
#eval $(ssh-agent)
#
#function cleanup {
#    echo "Killing SSH-Agent"
#    kill -9 $SSH_AGENT_PID
#}
# Make short hostname only if its not an IP address
__tm_get_hostname(){
    local HOST="$(echo $* | rev | cut -d ' ' -f 1 | rev)"
    if echo $HOST | grep -P "^([0-9]+\.){3}[0-9]+" -q; then
        echo $HOST
    else
        echo $HOST| cut -d . -f 1
    fi
}

__tm_get_current_window(){
    tmux list-windows| awk -F : '/\(active\)$/{print $1}'
}

# Rename window according to __tm_get_hostname and then restore it after the command
__tm_command() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=| cut -d : -f 1)" = "tmux" ]; then
        __tm_window=$(__tm_get_current_window)
        # Use current window to change back the setting. If not it will be applied to the active window
        trap "tmux set-window-option -t $__tm_window automatic-rename on 1>/dev/null" EXIT
        tmux rename-window "$(__tm_get_hostname $*)"
    fi
    command "$@"
}
function color_ssh () {
    trap "~/.config/zsh/colorterm.sh" INT EXIT
    if [[ "$*" =~ "prod" ]]; then
        /home/d3x734/.config/zsh/colorterm.sh prod
    elif [[ "$*" =~ "dev" ]]; then
        /home/d3x734/.config/zsh/colorterm.sh dev
    else
        /home/d3x734/.config/zsh/colorterm.sh other
    fi
    __tm_command ssh $*
}

#unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#fi
#export GPG_TTY=$(tty)
#gpg-connect-agent updatestartuptty /bye >/dev/null

#trap cleanup EXIT

