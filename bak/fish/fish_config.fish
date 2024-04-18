if status is-interactive
        source ~/.config/fish/Miku_func/__yazicd.fish
        source ~/.config/fish/Miku_func/__fzf_search_history.fish
        source ~/.config/fish/Miku_func/__fzf_search_directory.fish
        source ~/.config/fish/Miku_func/condaInit.fish
        source ~/.config/fish/Miku_func/toggleProxy.fish

        #NOTE: alias
        alias  v="nvim"
        alias  ls="eza"
        alias  la="eza -a"
        alias  lt="eza -T"
        alias  ltl="eza -T -L"
        alias  ll="eza -l"
        alias  lla="eza -l -a"
        alias  zl="yazi"


        alias  python="python3"


        starship init fish | source
        zoxide init fish | source


        #NOTE:" Environment variable
        set -x fish_greeting "Miku! Miku!"
        set -x EDITOR "nvim"
        # set -x DBUS_SESSION_BUS_ADDRESS "unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" #???

        set -x PATH /Users/Miku/.local/share/nvm/v19.6.0/bin $PATH # nvm.fish (plug) PATH
        # FZF_OPTS: bg+: bottom bar color, fg+: selected item color ,gutter: sidebar color
        set -x FZF_DEFAULT_OPTS "--color=bg+:-1,fg+:#BE002F,gutter:-1,border:#C0C0C0 \
                                 --no-separator \
                                 --no-scrollbar \
                                 --preview 'if test -d {}
                                                  eza --all --long {}
                                            else  
                                                  bat --color=always --line-range=:500 --theme=bash16 {}
                                            end'" 

        set -x FZF_DEFAULT_COMMAND "fd --hidden --exclude={Applications,Library,.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
        # clashx 
        # set -x https_proxy http://127.0.0.1:7890 
        # set -x http_proxy http://127.0.0.1:7890 
        # set -x all_proxy socks5://127.0.0.1:7890
        # clashx 
        set -x https_proxy http://127.0.0.1:20171 
        set -x http_proxy http://127.0.0.1:20171 
        set -x all_proxy socks5://127.0.0.1:20170
        # llvm
        set -x PATH /opt/homebrew/opt/llvm/bin $PATH
        set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
        set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
        # rust
        set -x PATH /Users/Miku/.cargo/bin $PATH


        # NOTE: key binding
        function fish_user_key_bindings
                bind -M default \co '__yazicd; and commandline -f repaint'
                # bind -M default \ef '__fzf_search_directory'
                bind -M default \cr '__fzf_search_history; and commandline -f repaint'
        end

end

