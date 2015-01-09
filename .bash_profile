# .bashrc

if [ -e /usr/share/terminfo/78/xterm-256color ]; then
        export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

source /usr/local/etc/bash_completion.d/git-prompt.sh

# change to empty to disable, add bash.showDirtyState,
#   bash.showUntrackFiles in git config to control per
#   git repository
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto verbose
export GIT_PS1_SHOWCOLORHINTS=true
export PROMPT_DIRTRIM=3

# Environment
PROMPT_COMMAND='__git_ps1 "
$(if [[ ${EUID} == 0 ]]; then echo "\[\e[1;31m\]"; else echo "\[\e[0;92m\]";fi)\u$(if [[ -n ${SSH_CLIENT} ]]; then echo "\[\e[0m\]@\[\e[0;92m\]\h";fi)\[\e[0m\]:\[\e[0;34m\][\[\e[0;96m\]${PWD//\//"\[\e[0m\]"/"\[\e[0;96m\]"}\[\e[0;34m\]]\[\e[0m\]" "

\[\e[0;97m\]\$\[\e[0m\] " " \[\e[0;97m\][%s\[\e[0;97m\]]"; echo -ne "\033]0;${HOSTNAME%%.*}:$(python ~/.short.pwd.py)\007"'; export PROMPT_COMMAND
#PS1="
#\[\033[1;32m\]\u@\h\[\033[00;00m\]:\[\033[01;36m\][\w]
#
#\[\033[00;00m\]\$ "; export PS1

PATH=$PATH:/usr/local/bin:/usr/local/opt/ruby/bin; export PATH
#PATH=$PATH:/Users/<user>/bin:/usr/local/share/npm/bin:/Users/<user>/src/Google/adt-bundle-mac-x86_64-20130514/sdk/platform-tools:/Users/<user>/src/Google/adt-bundle-mac-x86_64-20130514/sdk/tools; export PATH
source .github

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

shopt -s autocd
shopt -s cdspell
shopt -s cdable_vars
shopt -s dotglob
shopt -s globstar

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
