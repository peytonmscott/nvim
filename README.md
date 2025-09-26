# kickstart-fork

A fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with custom plugins.

## Installation

Clone this repo to your Neovim config directory:

```sh
git clone https://github.com/peytonmscott/kickstart-fork.git ~/.config/nvim
```

Run the install script for dependencies:

```sh
./install.sh
```

Start Neovim:

```sh
nvim
```

## Custom Plugins

- autopairs: Auto-pairing for brackets, quotes, etc.
- debug: Debugging support with codelldb.
- gitsigns: Git integration.
- indent_line: Indentation guides.
- lint: Linting.
- neo-tree: File explorer.

See `init.lua` for details.