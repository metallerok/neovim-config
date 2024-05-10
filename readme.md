# Start
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```


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

## Add file to harpoon
```
<leader>a1 -- puts file to first posistion
<leader>a2 -- puts file to second posistion
```

```
<leader>1 -- show first file
<leader>2 -- show second file
```
