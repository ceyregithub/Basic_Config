unalias run-help
autoload run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help
autoload -U promptinit
autoload -Uz vcs_info
promptinit
autoload -U colors && colors
HELPDIR=/usr/local/share/zsh/help
fpath=(/usr/local/share/zsh-completions $fpath)
# create a zkbd compatible hash;
# # to add other keys to this hash, see: man 5 terminfo
source ~/.zsh_users
typeset -A key

local reset green white gray red blue lblue
reset="%{[0m%}"
green="%{[38;5;34m%}"
white="%{[38;5;255m%}"
gray="%{[38;5;242m%}"
red="%{[38;5;160m%}"
blue="%{[38;5;27m%}"
lblue="%{[38;5;39m%}"

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
#[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
#[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     history-search-forward
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       history-search-backward
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
# The following lines were added by compinstall

zstyle ':completion:*' use-ip true
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' menu select
zstyle :compinstall filename '~/.zshrc'
zstyle -e ':completion:*' users 'reply=($myusers)'
zstyle ':completion:*:scp:*' tag-order 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:scp:*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns '<->.<->.<->.<->' '127.0.0.<->'
zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns adm bin daemon halt lp named shutdown sync
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
setopt hist_ignore_dups
setopt prompt_subst
setopt nohashdirs
setopt autolist
#bindkey -v
#bindkey '[A' history-search-backward
#bindkey '[B' history-search-forward
# End of lines configured by zsh-newuser-install
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%{[38;5;242m%}(%{[38;5;239m%}%s%{[38;5;242m%})%{[38;5;166m%}-%{[38;5;244m%}[%{[38;5;22m%}%b%{[38;5;202m%}%u%{[38;5;64m%}%c%{[38;5;202m%}|%{[38;5;88m%}%a%{[38;5;244m%}]%{[0m%}'
zstyle ':vcs_info:*' formats '%{[38;5;242m%}(%{[38;5;239m%}%s%{[38;5;242m%})%{[38;5;166m%}-%{[38;5;244m%}[%{[38;5;22m%}%b%{[38;5;202m%}%u%{[38;5;64m%}%c%{[38;5;244m%}]%{[0m%}'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%{[38;5;202m%}%r'

# change to empty to disable, add bash.showDirtyState,
#   bash.showUntrackFiles in git config to control per
#   git repository
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto verbose
export GIT_PS1_SHOWCOLORHINTS=true

# remove trailing space on RPROMPT
#ZLE_RPROMPT_INDENT=0
#source ~/.shell_prompt.sh
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
    fi
    chpwd() {
      print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
      }

      DIRSTACKSIZE=20

      setopt autopushd pushdsilent pushdtohome

      ## Remove duplicate entries
      #setopt pushdignoredups
      #
      ### This reverts the +/- operators.
      #setopt pushdminus

      source ~/.github

#PYTHONPATH=/usr/local/lib/python2.7/site-packages/; export PYTHONPATH

#The value of this variable describes what color to use for which attribute
#when colors are enabled with CLICOLOR.  This string is a concatenation of
#pairs of the format fb, where f is the foreground color and b is the
#background color. The color designators are as follows:
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background
#
#Note that the above are standard ANSI colors.  The actual display may
#differ depending on the color capabilities of the terminal in use.
#The order of the attributes are as follows:
# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
#
# Default Colors of LSCOLORS
# LSCOLORS = "exfxcxdxbxegedabagacad"
#         1122334455667788990011
LSCOLORS="ExGxBxDxCxEgEdCbCgCcCd"; export LSCOLORS
export LS_COLORS="rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lz=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.bz=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.rar=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:"

# User specific aliases and functions
alias la='ls -GA'
alias l='ls -GCF'
alias ll='ls -Glah'
alias ls='ls -G'
alias ticket='open /System/Library/CoreServices/Ticket\ Viewer.app'
alias unloadvpn='sudo launchctl unload /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist'
alias loadvpn='sudo launchctl load /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias gimp='/Applications/Gimp.app/Contents/MacOS/gimp-2.8'

alias fftest='function __fftest() { $@ -i ~/src/AesopLibx264/x264-snapshot-20121002-2245/704x480_test_55566_35.sdp out%000d.ppm; }; __fftest'
alias ffloop='ffmpeg -loop 1 -i ~/src/AesopLibx264/x264-snapshot-20121002-2245/704x480_ppm.ppm -vcodec libx264 -pix_fmt yuv420p -s 704x480 -f rtp -payload_type 35 rtp://localhost:55566'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
setopt PROMPT_SUBST

# Environment
function setprompt() {
    # local Arrays
    local -a lines infoline
    # Check for root, add hostname and prepare for PWD prompt
    infoline+=( '%(!.${red}.${green})%n' )
    # add hostname if SSH'ed into a machine
    [[ -n $SSH_CLIENT ]] && infoline+=( '${gray}@${green}%m' )
    infoline+=( '${reset}:${blue}[${lblue}' )
    # Add PWD and change / character to gray vs. lblue for PWD
    infoline+=( '${${(%):-%~}//\//${gray}/${lblue}}' )
    # Add the ending bracket
    infoline+=( '${blue}]${white}' )
    lines+=( ${(j::)infoline} )
    lines+=( '' )
    lines+=( '$ ${reset}' )
    PROMPT=${(F)lines}
    #print $PROMPT
}

function title() {
    # escape '%' chars in $1, make nonprintable visible
    local a=${(V)1//\%/\%\%}
    # Truncate command, and join lines
    a=$(print -Pn "%40>...>$a" | tr -d "\n")
    case $TERM in
        screen*)
            print -Pn "\e]2;$a @ $2\a" #plain xterm title
            print -Pn "\ek$a\e\\" # screen title (in ^A")
            print -Pn "\e_$2   \e\\" # screen location
            ;;
        xterm*)
            print -Pn "\e]2;$a @ $2\a" # plain xterm title
            ;;
    esac
}

function precmd() {
    vcs_info
    setprompt
    title "zsh" "%m"
}
function preexec() {
    title "$1" "%m"
}
#PROMPT='%(!.${red}.${green})%n${gray}@${green}%m${reset}:${blue}[${lblue}${${(%):-%~}//\//${gray}/${lblue}}${blue}]${white}
#
#$ ${reset}'
RPROMPT='${vcs_info_msg_0_}'
#echo -ne "\e[0;${HOSTNAME%%.*}:$(python ~/.short.pwd.py)\007" }
#setopt PROMPT_SUBST
#PS1="
#\[\033[1;32m\]\u@\h\[\033[00;00m\]:\[\033[01;36m\][\w]
#
#\[\033[00;00m\]\$ "; export PS1
#export ZSH_TMUX_AUTOSTART="true"
export ZSH_TMUX_FIXTERM_WITH_256COLOR="xterm-256color"

source ~/usr/share/zsh/plugins/brew/brew.plugin.zsh
source ~/usr/share/zsh/plugins/history/history.plugin.zsh
source ~/usr/share/zsh/plugins/osx/osx.plugin.zsh
source ~/usr/share/zsh/plugins/tmux/tmux.plugin.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.iterm2_shell_integration.zsh
