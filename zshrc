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
        --preview 'if [ -d {} ]; then
              eza --all --long {}
          else
              bat --color=always --line-range=:500 --theme=base16 {}  
          fi'"
# editor 
export EDITOR="nvim"
#### llvm
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
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
alias  zl="yazi"
alias  python="python3"

############################################
### myfun ##################################
function __yazicd() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

bindkey -s '^o' '__yazicd\n'




















