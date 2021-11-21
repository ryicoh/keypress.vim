# keypress.vim

When press a key on keyboard, triggers autocmd event `KeyPress`.
Only vim8.2+ is supported.

## Install

For Plug

```vim
Plug "ryicoh/keypress.vim"
```


## Usage

Show the pressed key.

```vim
autocmd User KeyPress echo keypress#current()
```

Show the history.

```vim
echo g:keypress#history
```
