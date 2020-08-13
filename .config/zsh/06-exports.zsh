export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto verbose
export GIT_PS1_SHOWCOLORHINTS=true
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LESS="-M -R"
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --force --style solarized-light"
# export LESSOPEN="|pygmentize -g -O style=solarized-light -f terminal256 %s"
export LS_COLORS="rs=0:di=38;5;27:ln=38;5;51:mh=01;04:pi=40;33:so=01;40;35:do=01;40;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=38;5;34:*.exe=38;5;34:*.com=38;5;34:*.tar=38;5;160:*.tgz=38;5;160:*.arj=38;5;160:*.taz=38;5;160:*.lzh=38;5;160:*.lzma=38;5;160:*.tlz=38;5;160:*.txz=38;5;160:*.zip=38;5;160:*.z=38;5;160:*.Z=38;5;160:*.dz=38;5;160:*.gz=38;5;160:*.lz=38;5;160:*.xz=38;5;160:*.bz2=38;5;160:*.bz=38;5;160:*.tbz=38;5;160:*.tbz2=38;5;160:*.tz=38;5;160:*.deb=38;5;160:*.rpm=38;5;160:*.jar=38;5;160:*.war=38;5;160:*.ear=38;5;160:*.sar=38;5;160:*.rar=38;5;160:*.ace=38;5;160:*.zoo=38;5;160:*.cpio=38;5;160:*.7z=38;5;160:*.rz=38;5;160:*.jpg=38;5;222:*.jpeg=38;5;222:*.jp2=38;5;222:*.jpg2=38;5;222:*.jpe=38;5;222:*.gif=38;5;222:*.bmp=38;5;222:*.pbm=38;5;222:*.pgm=38;5;222:*.ppm=38;5;222:*.tga=38;5;222:*.xbm=38;5;222:*.xpm=38;5;222:*.tif=38;5;222:*.tiff=38;5;222:*.png=38;5;222:*.svg=38;5;222:*.svgz=38;5;222:*.djvu=38;5;222:*.mng=00;33:*.pcx=00;33:*.mov=00;33:*.mpg=00;33:*.mpeg=00;33:*.m2v=00;33:*.mkv=00;33:*.ogm=00;33:*.mp4=00;33:*.m4v=00;33:*.mp4v=00;33:*.vob=00;33:*.qt=00;33:*.nuv=00;33:*.wmv=00;33:*.asf=00;33:*.rm=00;33:*.rmvb=00;33:*.flc=00;33:*.avi=00;33:*.fli=00;33:*.flv=00;33:*.gl=38;5;222:*.dl=38;5;222:*.xcf=38;5;222:*.xwd=38;5;222:*.yuv=00;33:*.cgm=38;5;222:*.emf=38;5;222:*.axv=38;5;222:*.anx=38;5;222:*.ogv=00;33:*.ogx=38;5;222:*.aac=38;5;172:*.au=38;5;172:*.flac=38;5;172:*.mid=38;5;172:*.midi=38;5;172:*.mka=38;5;172:*.mp3=38;5;172:*.mpc=38;5;172:*.ogg=38;5;172:*.ra=38;5;172:*.wav=38;5;172:*.axa=38;5;172:*.oga=38;5;172:*.spx=38;5;172:*.xspf=38;5;172:*.html=00;35:*.HTML=00;35:*.htm=00;35:*.HTM=00;35:*.php=00;35:*.pgp=31:*.asc=31:*.tex=38;5;39:*~=38;5;244:*.pdf=38;5;125:*.PDF=38;5;125:*.go=38;5;97:*.c=38;5;97:*.C=38;5;97:*.cxx=38;5;97:*.CXX=38;5;97:*.py=38;5;97:*.sh=38;5;98:*.h=38;5;92:*.H=38;5;92:*.hxx=38;5;92:*.HXX=38;5;92:"
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem
export ZSH_TMUX_FIXTERM_WITH_256COLOR="xterm-256color"
export ZSH_TMUX_AUTOSTART="true"
export GOPATH="$HOME/go"
export TASKRC="$HOME/.config/task/taskrc"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export PLASMA_USE_QT_SCALING=1
export PASSWORD_STORE_DIR=~/.config/password-store
export PASSWORD_STORE_TOMB_FILE=~/.config/store/password.tomb
export PASSWORD_STORE_TOMB_KEY=~/.config/store/.password.tomb.key
export MOZ_ENABLE_WAYLAND=1
