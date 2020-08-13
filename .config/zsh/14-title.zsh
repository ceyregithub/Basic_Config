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
