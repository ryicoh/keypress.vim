let g:keypress#history = []

func! keypress#start()
    if !exists("s:filter_popup_id")
        autocmd User KeyPress call s:nop()

        let s:filter_popup_id = popup_create(
            \ '',
            \ {
            \     "filter": { _, key -> s:handle_key(key)},
            \     "zindex": 10000,
            \     "mask": [[0, 1, 0, 1]],
            \ })
    endif
endfunc

func! s:handle_key(key)
    call add(g:keypress#history, a:key)
    doautocmd User KeyPress
endfunc

func! s:nop()
endfunc
