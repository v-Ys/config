############################################
### option #################################
eval "$(zoxide init bash)"
eval "$(starship init bash)"
set bell-style none
set -o emacs

############################################
### ENV ####################################
# FZF 
export FZF_DEFAULT_COMMAND="fd --hidden --exclude={Applications,Library,.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--color=bg+:-1,fg+:#BE002F,gutter:-1,border:#C0C0C0 \
        --no-separator \
        --no-scrollbar \
        --preview 'if test -d {}  
        exa --all --long {} 
else  
        bat --color=always --line-range=:500 --theme=OneHalfLight {}  
end'" 
# editor 
export EDITOR="nvim"
#Rust 
export PATH=/Users/Miku/.cargo/bin:$PATH
#### llvm
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
#clash
export https_proxy="http://127.0.0.1:7890"
export http_proxy="http://127.0.0.1:7890"
export all_proxy="socks5://127.0.0.1:7890"

############################################ 
### alias ################################## 
alias nv="nvim" 
alias c="cd" 
alias e="exa" 
alias et="exa -T" 
alias etl="exa -T -L" 
alias ea="exa -a" 
alias el="exa -l" 
alias ela="exa -l -a" 


############################################
### myfun ##################################
lfcd () {
        tmp="$(mktemp)"
        lf -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
                dir="$(cat "$tmp")"
                rm -f "$tmp"
                [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        fi
}
