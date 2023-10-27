# >>> conda initialize >>>
function conda_init
        if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
                eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
        end
end
