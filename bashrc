############################################
### option #################################
set bell-style none
set -o emacs
eval "$(zoxide init bash)"
eval "$(starship init bash)"

############################################
### ENV ####################################
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--color=bg+:-1,fg+:#BE002F,gutter:-1,border:#C0C0C0,hl+:#0DBC79,hl:#0DBC79 
                         --bind 'ctrl-y:execute-silent(echo -n {1..} | pbcopy)+abort,ctrl-r:toggle-sort'
                         --no-separator --no-scrollbar --reverse --height 40%"
export FZF_DEFAULT_COMMAND="fd --hidden"
#llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export PATH=/opt/homebrew/opt/node@20/bin:$PATH
# vpn
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890 
export all_proxy=socks5://127.0.0.1:7890

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
function yy() {
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
    local output opts script n x y z d
    opts="${FZF_DEFAULT_OPTS-} --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --reverse -n2..,.. +m --read0 "
    [[ $(HISTTIMEFORMAT='' builtin history 1) =~ [[:digit:]]+ ]]  
    script='function P(b) { ++n; sub(/^[ *]/, "", b); if (!seen[b]++) { printf "%d\t%s%c", '$((BASH_REMATCH + 1))' - n, b, 0 } }
            NR==1 { b = substr($0, 2); next }
            /^\t/ { P(b); b = substr($0, 2); next }
            { b = b RS $0 }
            END { if (NR) P(b) }'
    output=$(
        set +o pipefail
        builtin fc -lnr -2147483648 2> /dev/null |   
        command awk "$script"           |   
        FZF_DEFAULT_OPTS="$opts" fzf --query "$READLINE_LINE"
    ) || return
    READLINE_LINE=${output#*$'\t'}
    if [[ -z "$READLINE_POINT" ]]; then
        echo "$READLINE_LINE"
    else
        READLINE_POINT=0x7fffffff
    fi
}
bind -m emacs-standard '"\er": redraw-current-line'
bind -m emacs-standard '"\C-r": "\C-e \C-u\C-y\ey\C-u`__fzf_history__`\e\C-e\er"'

