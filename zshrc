############################################
### option #################################
setopt AUTO_CD
set -o emacs
unsetopt BEEP
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

############################################
### ENV ####################################
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--color=bg+:-1,fg+:#BE002F,gutter:-1,border:#C0C0C0,hl+:#0DBC79,hl:#0DBC79 
                         --bind 'ctrl-y:execute-silent(echo -n {1..} | pbcopy)+abort,ctrl-r:toggle-sort'
                         --no-separator --no-scrollbar --reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --hidden"
#### llvm
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export PATH=/opt/homebrew/opt/node@20/bin:$PATH
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
# vpn
export https_proxy="http://127.0.0.1:20171"
export http_proxy="http://127.0.0.1:20171"
export all_proxy="socks5://127.0.0.1:20170"

############################################ 
### alias ################################## 
alias  v="nvim"
alias  ls="eza"
alias  la="eza -a"
alias  lt="eza -T"
alias  ltl="eza -T -L"
alias  ll="eza -l"
alias  lla="eza -l -a"
alias  yz="yazi"

############################################
### myfun ##################################
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
