# Start
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

## Also for LSP need NoneJS v20+

```bash
git clone https://github.com/metallerok/neovim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

# Package manager
```
:Lazy
```

# Lsp
```
:Mason
```

# Leader key is SPACE
## Open project tree
```
<leader>e
```

# Tips
## to update higlihted strings
with selected block
```
test
the_best
```
`:norm I_some_text`
```
test_some_text
the_best_some_text
```

## to increace numbers

```
test0
test0
test0
```
with celected block

`g<C-a>`

```
test1
test2
test3
```

## find replace
``:s/foo/bar/gc`, `g` - current line, `c` - confirm ask

## refactor during project
```
:vimgrep /var/ `find . -type f`
:copen
:cdo %s/var/new_var/gc
```
