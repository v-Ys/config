############################################
### option #################################
setopt AUTO_CD
set -o emacs
unsetopt BEEP

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


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
bindkey -s '^o' 'lfcd\n'


############################################
### Added by Zinit's installer #############
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
        print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
        command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
        command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
                print -P "%F{33} %F{34}Installation successful.%f%b" || \
                print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# (this is currently required for annexes)
zinit light-mode for \
        zdharma-continuum/zinit-annex-as-monitor \
        zdharma-continuum/zinit-annex-bin-gem-node \
        zdharma-continuum/zinit-annex-patch-dl \
        zdharma-continuum/zinit-annex-rust
############################################
### Plug ###################################

autoload -Uz compinit && compinit # for fzf-tab
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting


















