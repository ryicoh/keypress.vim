augroup keypress
    au!
    au VimEnter * call keypress#start()
    au BufRead * call keypress#start()
augroup END
