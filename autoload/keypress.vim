let g:keypress#history = []

func! keypress#current() abort
    if len(g:keypress#history) > 0
        return g:keypress#history[-1]
    endif

    return ""
endfunc

func! keypress#start() abort
    augroup keypressstart
        au!
        au User KeyPress :
    augroup END

    call s:create_popup()
endfunc

func! s:create_popup() abort
    if exists("s:filter_popup_id")
        let s:closing = 1
        call popup_close(s:filter_popup_id)
        let s:closing = 0
    endif

    let s:filter_popup_id = popup_create(
        \ [],
        \ #{
        \     filter: { _, key -> s:handle_key(key)},
        \     zindex: 10000,
        \     line: 0,
        \     col: 0,
        \     mask: [[0, 1, 0, 1]],
        \     callback: function('s:callback'),
        \ })
endfunc

func! s:handle_key(key) abort
    call add(g:keypress#history, a:key)
    doautocmd User KeyPress
endfunc

func! s:callback(_, __) abort
    if exists("s:closing") && s:closing
        return
    endif

    call s:handle_key("\<c-c>")
    call s:create_popup()
endfunc
