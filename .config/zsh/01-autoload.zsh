unalias run-help >/dev/null 2>/dev/null
autoload run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help
HELPDIR=/usr/local/share/zsh/help
fpath=(/usr/local/share/zsh-completions $fpath)
