
# fzf search home directory >>> 
function __fzf_search_directory --description "Search the root directory"
        set -f file_paths_selected (fd . ~/ --hidden  | fzf)
        if test $status -eq 0
                commandline --current-token --replace -- (string escape -- $file_paths_selected | string join '')
        end
        commandline --function repaint
end
