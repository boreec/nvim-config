# Neovim Configuration

This repository contains my personal neovim setup. While I strive to keep it
clean and functional, I can not guarantee that everything will always work
perfectly. Use it at your own risk.

## Contents

### Plugin manager

The plugins are handled by [lazy.nvim](https://github.com/folke/lazy.nvim).

The configuration is organized with the same structure as recommended by
the official documentation.

### Colorscheme

The main colorscheme is `kanagawa-wave` from
 [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim).

It is configured in `lua/plugins/colorscheme.lua`.

### Languages support

Language syntax highlighting is handled by
 [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 and configured for:

- [bash](https://github.com/tree-sitter/tree-sitter-bash)
- [c](https://github.com/tree-sitter/tree-sitter-c),
 [cpp](https://github.com/tree-sitter/tree-sitter-cpp)
- [dockerfile](https://github.com/camdencheek/tree-sitter-dockerfile)
- [gitignore](https://github.com/shunsambongi/tree-sitter-gitignore)
- [go](https://github.com/tree-sitter/tree-sitter-go),
 [gomod](https://github.com/camdencheek/tree-sitter-go-mod),
 [gosum](https://github.com/tree-sitter-grammars/tree-sitter-go-sum),
 [gowork](https://github.com/omertuc/tree-sitter-go-work)
- [graphql](https://github.com/bkegley/tree-sitter-graphql)
- [json](https://github.com/tree-sitter/tree-sitter-json)
- [lua](https://github.com/tree-sitter-grammars/tree-sitter-lua)
- [make](https://github.com/alemuller/tree-sitter-make)
- [markdown](https://github.com/tree-sitter-grammars/tree-sitter-markdown)
- [proto](https://github.com/treywood/tree-sitter-proto)
- [python](https://github.com/tree-sitter/tree-sitter-python)
- [rust](https://github.com/tree-sitter/tree-sitter-rust)
- [sql](https://github.com/derekstride/tree-sitter-sql)
- [toml](https://github.com/tree-sitter-grammars/tree-sitter-toml)
- [typescript](https://github.com/tree-sitter/tree-sitter-typescript)
- [xml](https://github.com/tree-sitter-grammars/tree-sitter-xml)
- [yaml](https://github.com/tree-sitter-grammars/tree-sitter-yaml)

LSPs are handled by the combination of plugins:
- [mason](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

It is configured in `lua/plugins/lsp.lua` and offers support for:
- lua with the LSP `lua_ls`

### Searching

Searching the filesystem, files content or the buffers is handled by
[telescope](https://github.com/nvim-telescope/telescope.nvim).
