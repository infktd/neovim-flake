# Configuration Structure - NVF Documentation Aligned

The configuration has been reorganized to **map directly to NVF's option hierarchy**. This makes it much easier to customize by referencing the [official NVF documentation](https://nvf.notashelf.dev/options.html).

## New Structure

Each module now corresponds to a top-level `vim.*` option in NVF:

| File | NVF Option | Purpose |
|------|------------|---------|
| `options.nix` | `vim.options`, `vim.globals` | Basic Neovim settings, leader key |
| `theme.nix` | `vim.theme` | Color scheme (Gruvbox) |
| `statusline.nix` | `vim.statusline` | Status bar (lualine) |
| `tabline.nix` | `vim.tabline` | Buffer/tab line at top (nvimBufferline) |
| `filetree.nix` | `vim.filetree` | File explorer (neo-tree) |
| `dashboard.nix` | `vim.dashboard` | Startup screen (alpha) |
| `ui.nix` | `vim.ui` | UI elements (borders, noice) |
| `treesitter.nix` | `vim.treesitter` | Syntax highlighting and parsing |
| `autocomplete.nix` | `vim.autocomplete` | Completion engine (blink.cmp) |
| `lsp.nix` | `vim.lsp` | LSP configuration |
| `languages.nix` | `vim.languages` | Per-language LSP/formatter/linter |
| `telescope.nix` | `vim.telescope` | Fuzzy finder |
| `git.nix` | `vim.git` | Git integration (gitsigns) |
| `utility.nix` | `vim.utility` | Utility plugins (surround, undotree) |
| `binds.nix` | `vim.binds`, `vim.keymaps` | Which-key and all keybindings |
| `extra.nix` | `vim.extraPlugins` | Non-native plugins (flash, copilot, claude) |

## Benefits of This Structure

1. **Easy to find settings**: Want to change the theme? Look in `theme.nix`
2. **Direct documentation mapping**: Every file maps to a section in NVF docs
3. **Clear separation**: Native NVF features vs custom plugins (extra.nix)
4. **Easy customization**: Reference [nvf.notashelf.dev/options](https://nvf.notashelf.dev/options.html) to see all available options

## How to Customize

### Finding Options

1. Go to https://nvf.notashelf.dev/options.html
2. Search for the option you want (e.g., `vim.theme.name`)
3. Edit the corresponding file (e.g., `config/theme.nix`)
4. Rebuild: `nix build && ./result/bin/nvim`

### Examples

**Change color scheme to Catppuccin:**
```nix
# config/theme.nix
{
  config.vim.theme = {
    enable = true;
    name = "catppuccin";  # was "gruvbox"
    style = "mocha";
  };
}
```

**Add another language (Zig):**
```nix
# config/languages.nix - add to existing languages:
vim.languages.zig = {
  enable = true;
  lsp.servers = ["zls"];
  format.type = ["zigfmt"];
};
```

**Adjust neo-tree width:**
```nix
# config/filetree.nix
{
  config.vim.filetree.neo-tree = {
    enable = true;
    setupOpts = {
      window.width = 40;  # was 30
    };
  };
}
```

**Change leader key:**
```nix
# config/options.nix
{
  config.vim.globals.mapleader = ",";  # was " " (space)
}
```

## Native vs Extra Plugins

### Use Native NVF Options When Available

NVF has built-in support for many plugins. Always prefer these over `extraPlugins`:
- `vim.tabline.nvimBufferline` (bufferline) - using native mappings
- `vim.statusline.lualine` (lualine)
- `vim.filetree.neo-tree` (neo-tree) - using native mappings
- `vim.autocomplete.blink-cmp` (blink.cmp)
- `vim.telescope` (telescope) - using native mappings
- `vim.git.gitsigns` (gitsigns) - using native mappings
- `vim.lsp` (LSP) - using native mappings

### Use extra.nix for Non-Native Plugins

Only use `vim.extraPlugins` for plugins that don't have NVF options:
- flash.nvim (enhanced motion)
- copilot.lua (GitHub Copilot)
- claudecode.nvim (Claude Code)
- direnv-vim (direnv integration)
- diffview.nvim (git diff viewer)

## Migration Notes

The old structure had overlapping concerns:
- `core.nix` - mixed options and globals
- `ui.nix` - had theme + statusline + filetree + UI settings
- `editor.nix` - mixed treesitter + completion + utilities
- `tools.nix` - mixed telescope + flash + direnv
- `keybinds.nix` - only keybinds

The new structure is cleaner:
- One file = one `vim.*` option
- Clear separation of concerns
- Direct mapping to documentation
- Native vs extra plugins clearly distinguished
- Native nvf mappings used for all supported plugins

## Quick Reference

To enable/disable features, just set `enable = true/false` in the corresponding file:

```nix
# config/dashboard.nix - disable startup screen
{
  config.vim.dashboard.alpha.enable = false;
}
```

```nix
# config/tabline.nix - disable buffer bar
{
  config.vim.tabline.nvimBufferline.enable = false;
}
```

All configuration follows the same pattern: find the option in [NVF docs](https://nvf.notashelf.dev/options.html), edit the corresponding file, rebuild.
