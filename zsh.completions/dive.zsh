#compdef dive

_dive() {
    local line state

    _arguments -C \
               "1: :->cmds" \
               "*::arg:->args"

    case "$state" in
        cmds)
            _values "dive commands" \
                    "ls" \
                    "open" \
                    "help"
            ;;
        args)
            case $line[1] in
                ls)
                    ;;
                open)
                    _dive_open
                    ;;
            esac
            ;;
    esac
}

_dive_open() {
    _arguments -C \
           "*::arg:->args"
    case "$state" in
        args)
            _values "Project" \
                    $(dive ls)
            ;;
    esac
}

compdef _dive dive
