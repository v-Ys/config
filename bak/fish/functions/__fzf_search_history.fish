# >>> fzf search command history >>> 
function __fzf_search_history --description "Search command history. Replace the command line with the selected command."
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

