if status is-interactive


        #NOTE: alias

        alias  nv="nvim"
        alias  c="cd"
        alias  e="exa"
        alias  et="exa -T"
        alias  etl="exa -T -L"
        alias  ea="exa -a"
        alias  el="exa -l"
        alias  ela="exa -l -a"
        alias  rf="rm -r -f"

        #NOTE: --?

        #### starship
        starship init fish | source
        #### zoxide
        zoxide init fish | source
        #### --?
        set -x EDITOR "nvim"
        set -x DBUS_SESSION_BUS_ADDRESS "unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

        #### FZF ####################
        # FZF_DEFAULT_OPTS
        # bg+: bottom bar color
        # fg+: selected item color
        # gutter: sidebar color
        #############################
        set -x FZF_DEFAULT_COMMAND "fd --hidden --exclude={Applications,Library,.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
        set -x FZF_DEFAULT_OPTS "--color=bg+:-1,fg+:#BE002F,gutter:-1,border:#C0C0C0
        --no-separator 
        --no-scrollbar
        --preview 'if test -d {} 
        exa --all --long {} 
else 
        bat --color=always --line-range=:500 --theme=OneHalfLight {} 
end'"



#NOTE:" Environment variable

#### nvm.fish (plug) PATH 
set -x PATH /Users/Miku/.local/share/nvm/v19.6.0/bin $PATH
#### rust
set -x PATH /Users/Miku/.cargo/bin $PATH
#### llvm
set -x PATH /opt/homebrew/opt/llvm/bin $PATH
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
#### Java
set -x PATH /opt/homebrew/opt/openjdk/bin $PATH
#### homebrew PATH 
# set -x PATH /opt/homebrew/sbin $PATH
# set -x PATH /opt/homebrew/bin $PATH


#NOTE: clashx

set -x https_proxy http://127.0.0.1:7890 
set -x http_proxy http://127.0.0.1:7890 
set -x all_proxy socks5://127.0.0.1:7890


#NOTE: function

function _lfcd
        set tmp (mktemp)
        lf -last-dir-path=$tmp $argv
        if test -f $tmp
                set dir (cat $tmp)
                rm -f $tmp
                if test -d $dir -a $dir != (pwd)
                        cd $dir
                end
        end
end

function _fzf_search_directory --description "Search the root directory"
        set -f file_paths_selected (fd . ~/ --hidden  | fzf)
        if test $status -eq 0
                commandline --current-token --replace -- (string escape -- $file_paths_selected | string join '')
        end
        commandline --function repaint
end

function _fzf_search_history --description "Search command history. Replace the command line with the selected command."
        if test -z "$fish_private_mode"
                builtin history merge
        end

        set -f commands_selected (
        builtin history --null --show-time="%m-%d %H:%M:%S │ " |
        fzf  --read0 \
                --print0 \
                --multi \
                --tiebreak=index \
                --prompt="Search History> " \
                --query=(commandline) \
                --preview="echo -- {4..} | fish_indent --ansi" \
                --preview-window="bottom:3:wrap" |
        string split0 |
        string replace --regex '^\d\d-\d\d \d\d:\d\d:\d\d │ ' ''
        )

        if test $status -eq 0
                commandline --replace -- $commands_selected
        end
        commandline --function repaint
end


function fish_user_key_bindings
        bind -M default \co '_lfcd; and commandline -f repaint'
        bind -M default \ef '_fzf_search_directory'
        bind -M default \cr '_fzf_search_history; and commandline -f repaint'

end

# >>> conda initialize >>>
function conda_init
        if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
                eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
        end
end


############################
#### END
############################
end


