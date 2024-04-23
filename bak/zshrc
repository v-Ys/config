# zprofile: login ,zshenv:
. "$HOME/.profile"

setopt AUTO_CD
set -o emacs
unsetopt BEEP

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

yy() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

venv() {
    if [ -z "$1" ]; then
        echo "Error"
        return 1
    fi
    source ~/.vPyEnv/"$1"/bin/activate
}

__fzf_history__() {
    local selected num
    setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
    selected="$(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
                FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS-} -n2..,.. --query=${(qqq)LBUFFER} +m
                --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'" fzf)"
    local ret=$?
    if [ -n "$selected" ]; then
        num=$(awk '{print $1}' <<< "$selected")
        if [[ "$num" =~ '^[1-9][0-9]*\*?$' ]]; then
            zle vi-fetch-history -n ${num%\*}
        else # selected is a custom query, not from history
            LBUFFER="$selected"
        fi
    fi
    zle reset-prompt
    return $ret
}
zle     -N            __fzf_history__
bindkey -M emacs '^R' __fzf_history__
