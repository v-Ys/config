
call NERDTreeAddKeyMap({
               \ 'key': 'i',
               \ 'callback': 'NERDTreeMenuUp',
               \ 'quickhelpText': '1234',
               \ 'override': '1',
               \ 'scope': 'all' })
 function! NERDTreeMenuUp(all)
            echo k
        endfunction

