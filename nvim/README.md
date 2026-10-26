# Neovim config

Neovim configuration. Plugin manager: lazy.nvim. Leader key: `Space`.

## Requirements

| Item | Used for |
| --- | --- |
| Neovim 0.11 or later | Everything |
| git, make, unzip | Plugin install, fzf build |
| ripgrep (`rg`) | Telescope grep |
| fd | Telescope file search |
| cargo | Build of blink.cmp |
| Nerd Font | Icons (`vim.g.have_nerd_font = true`) |

Mason installs: `lua-language-server`, `stylua`, `ty`, `ruff`.

## Install

1. Clone this repo.
2. Link the `nvim` directory:
   `ln -s /path/to/dotfiles/nvim ~/.config/nvim`
3. Start `nvim`.
4. Wait. Lazy installs plugins. Mason installs tools.
5. Run `:checkhealth` and `:checkhealth custom`.
6. Fix every warning for tools you use.

WARNING: Move any existing `~/.config/nvim` first. The link fails if it exists.

## Layout

```text
init.lua                       Entry point. Loads the modules below.
lua/13cronil/core/options.lua  Editor options.
lua/13cronil/core/keymaps.lua  Global keymaps and diagnostics.
lua/13cronil/core/autocmds.lua Autocommands.
lua/13cronil/lazy.lua          Bootstrap, main plugins, LSP.
lua/13cronil/core/plugins/     One file per extra plugin. Auto-loaded.
lua/13cronil/ui/               UI setup.
lua/custom/health.lua          Health check. Run `:checkhealth custom`.
.stylua.toml                   Lua formatter settings.
```

## Keymaps

### Search (Telescope)

| Key | Action |
| --- | --- |
| `<leader>sf` | Files |
| `<leader>sg` | Grep |
| `<leader>sw` | Word under cursor |
| `<leader>s/` | Grep in open files |
| `<leader>/` | Search current buffer |
| `<leader><leader>` | Buffers |
| `<leader>s.` | Recent files |
| `<leader>sr` | Resume last search |
| `<leader>sd` | Diagnostics |
| `<leader>sh` | Help |
| `<leader>sk` | Keymaps |
| `<leader>sc` | Commands |
| `<leader>ss` | Telescope pickers |
| `<leader>sn` | Neovim config files |

### LSP (active when a server is attached)

| Key | Action |
| --- | --- |
| `grn` | Rename |
| `gra` | Code action |
| `grr` | References |
| `gri` | Implementation |
| `grd` | Definition |
| `grD` | Declaration |
| `grt` | Type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<leader>th` | Toggle inlay hints |

### Git (gitsigns)

| Key | Action |
| --- | --- |
| `]c` / `[c` | Next / previous change |
| `<leader>hs` | Stage or unstage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle line blame |
| `<leader>tD` | Show deleted lines |

### Debug (DAP)

| Key | Action |
| --- | --- |
| `F5` | Start / continue |
| `F1` | Step into |
| `F2` | Step over |
| `F3` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |
| `F7` | Toggle debug UI |

### Other

| Key | Action |
| --- | --- |
| `-` | Open parent directory (Oil) |
| `<leader>--` | Oil in floating window |
| `<leader>u` | Undo tree |
| `<leader>f` | Format buffer |
| `<leader>q` | Diagnostics to location list |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<C-h/j/k/l>` | Move between windows |
| `<C-S-h/j/k/l>` | Move window |
| `J` / `K` (visual) | Move selected lines down / up |
| `<Esc>` | Clear search highlight |
| `<Esc><Esc>` (terminal) | Leave terminal mode |

Arrow keys in normal mode are disabled.

## Procedures

### Add a plugin

1. Create `lua/13cronil/core/plugins/<name>.lua`.
2. Return a lazy.nvim spec from the file.
3. Restart `nvim`.

### Add a language server

1. Add the server to `servers` in `lua/13cronil/lazy.lua`.
2. Add the Mason package name to `ensure_installed` in the same file.
3. Restart `nvim`.

### Format Lua code

Run `stylua .` in the `nvim` directory.

## Fault finding

| Symptom | Action |
| --- | --- |
| Plugin broken after update | `:Lazy restore` |
| Tool missing | `:Mason` |
| blink.cmp build fails | Install cargo. Run `:Lazy build blink.cmp`. |
| Icons show as boxes | Install a Nerd Font. Set it in the terminal. |
| Telescope grep finds nothing | Install ripgrep. |
| Unknown cause | `:checkhealth` |
