# keypress.vim

When press a key on keyboard, triggers autocmd event `KeyPress`.

## Install

For Plug

```vim
Plug "ryicoh/keypress.vim"
```


## Usage

Show the pressed key.

```vim
autocmd User KeyPress echo g:keypress#history[-1]
```
