if status is-interactive


        #NOTE: alias

        alias nv="nvim"
        alias c="cd"
        alias  e="exa"
        alias  et="exa -T"
        alias  etl="exa -T -L"
        alias  ea="exa -a"
        alias  el="exa -l"
        alias  ela="exa -l -a"
        alias  rf="rm -r -f"

        function f
                 cd (fd . ~ --hidden | fzf --preview 'bat --color=always {}')
        end

        function fj
                 cd (dirname (fd . ~ --hidden | fzf --preview 'bat --color=always {}'))
        end
        #NOTE: --?

        #### starship
        starship init fish | source
        #### zoxide
        zoxide init fish | source
        #### --?
        export EDITOR="nvim"
        export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
        #### FZF
        export FZF_DEFAULT_COMMAND="fd --hidden --exclude={Applications,Library,.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
        export FZF_DEFAULT_OPTS="--color=bg+:-1,fg+:4,gutter:-1 --preview 'bat --color=always {}'"
        export FZF_CTRL_T_OPTS="--height 40% --exact --reverse --preview 'bat --color \"always\" {}'"
        #### homebrew mirrors
        # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles


        #NOTE:" Environment variable

        #### nvm.fish (plug) PATH 
        set -x PATH /Users/Miku/.local/share/nvm/v19.6.0/bin $PATH
        #### rust
        set -x PATH /Users/Miku/.cargo/bin $PATH
        #### python3
        # set -x PATH /Users/Miku/.pyenv/shims/python3 $PATH
        alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew" # avoid bug
        #### homebrew PATH 
        # set -x PATH /opt/homebrew/sbin $PATH
        # set -x PATH /opt/homebrew/bin $PATH

        #NOTE: clashx

        export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
        # function proxy_on
        #     export   https_proxy=http://127.0.0.1:7890 
        #     export   http_proxy=http://127.0.0.1:7890 
        #     export   all_proxy=socks5://127.0.0.1:7890
        #     echo -e "终端代理已开启。"
        # end
        #
        # function proxy_off
        #     export   https_proxy=
        #     export   http_proxy=
        #     export   all_proxy=
        #     echo -e "终端代理已关闭。"
        # end




        # NOTE: key bind

        # function fish_user_key_bindings
        #         bind -M default \co 'lfcd; and commandline -f repaint'
        # end


end

