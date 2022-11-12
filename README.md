# Neovim Config

This is meant for use with [NvChad](https://github.com/nvchad/nvchad)
Edited to work with the [Colemak](https://colemak.com/) keyboard layout.

Changes:
Basic Movement
- `h` -> `h` (no change)
- `j` -> `n`
- `k` -> `e`
- `l` -> `i`

Insert
- `i` -> `u`

Undo
- `u` -> `l`

Everything else is the same as the vim bindings

[Inspiration from the creator of NvChad](https://github.com/siduck/dotfiles/tree/master/nvchad/custom)

## Quickstart

```bash
git clone https://github.com/AlexanderHOtt/neovim-config/ ~/.config/nvchad_custom
ln -s ~/.config/nvchad_custom/ ~/.config/nvim/lua/custom
```

**Note:** Make sure to run `:PackerSync` after nvim launches.

## [NvChad Setup](https://nvchad.github.io/quickstart/install)

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
