# neovim-flake

> A batteries-included, modular Neovim configuration built with NVF (Neovim Flake Framework)

Features Helix-style keybind discovery, AI assistants (GitHub Copilot + Claude Code), comprehensive language support, and integrated development environment tooling - all configured with Nix for reproducibility.

## Features

- **Gruvbox Theme** - Beautiful dark color scheme with neo-tree file explorer
- **Keybind Discovery** - Which-key with modern preset - press Space and learn as you go
- **AI Sidebar** - Sidekick.nvim for GitHub Copilot CLI and Claude Code CLI integration
- **13 Languages** - Full LSP, formatters, and linters for:
  - Nix, Python, Rust, TypeScript/JavaScript, Bash
  - Markdown, Go, Lua, HTML, CSS, JSON, YAML, TOML
- **LSP Features** - Format on save, diagnostics, trouble.nvim, null-ls integration
- **Enhanced Motion** - Flash.nvim for quick jumps with visual labels
- **Dev Environments** - Direnv integration for automatic per-project environments
- **Fuzzy Finding** - Telescope with custom layout for files, grep, and more
- **Git Integration** - Gitsigns with inline blame + diffview for diffs
- **Smart Completion** - Blink.cmp (Rust-powered) with signature help built-in
- **Buffer Bar** - bufferline.nvim for easy buffer/tab navigation
- **Multi-Platform** - Supports x86_64-linux and aarch64-darwin

## Quick Start

### Try it immediately (no installation)

```bash
nix run github:infktd/neovim-flake
```

### Build locally

```bash
git clone https://github.com/infktd/neovim-flake.git
cd neovim-flake
nix build
./result/bin/nvim
```

### First-time setup

After launching Neovim:

1. **AI CLI Tools** (optional):
   
   For GitHub Copilot:
   ```bash
   gh extension install github/gh-copilot
   gh auth login
   ```
   
   For Claude Code:
   - Install from: https://docs.anthropic.com/en/docs/claude-code
   
   Then use `<Space>at` to toggle Sidekick sidebar and run:
   - `gh copilot suggest "your request"` for Copilot
   - `claude` for Claude Code

2. **Discover keybinds**:
   - Press `<Space>` and wait - which-key shows everything!

### Integration Options

```nix
### Integration Options

#### NixOS Configuration

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim-flake.url = "github:infktd/neovim-flake";
  };

  outputs = { nixpkgs, neovim-flake, ... }: {
    nixosConfigurations.hostname = nixpkgs.lib.nixosSystem {
      modules = [
        neovim-flake.nixosModules.default
        {
          programs.nvf.enable = true;
        }
      ];
    };
  };
}
```

#### Home-Manager

```nix
#### Home-Manager

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    neovim-flake.url = "github:infktd/neovim-flake";
  };

  outputs = { home-manager, neovim-flake, ... }: {
    homeConfigurations."user@hostname" = home-manager.lib.homeManagerConfiguration {
      modules = [
        neovim-flake.homeManagerModules.default
        {
          programs.nvf.enable = true;
        }
      ];
    };
  };
}
```

#### Standalone Package

```nix
# In your NixOS configuration.nix or home.nix
#### Standalone Package

```nix
{
  inputs.neovim-flake.url = "github:infktd/neovim-flake";
  
  # In your configuration:
  environment.systemPackages = [
    inputs.neovim-flake.packages.${system}.default
  ];
}
```

#### Nixpkgs Overlay

```nix
#### Nixpkgs Overlay

```nix
{
  inputs.neovim-flake.url = "github:infktd/neovim-flake";
  
  nixpkgs.overlays = [
    neovim-flake.overlays.default
  ];
  
  environment.systemPackages = [ pkgs.neovim-flake ];
}
```

## Key Bindings

**Leader key: `<Space>`**

Press `<Space>` and wait - which-key will show you all available commands organized by category!

### Main Groups

- `<Space>f` - **Find** (Telescope fuzzy finding)
- `<Space>l` - **LSP** (Language server actions)
- `<Space>g` - **Git** (Git operations)
- `<Space>a` - **AI** (Copilot and Claude Code)
- `<Space>c` - **Code** (Comments, undotree)
- `<Space>b` - **Buffer** (Buffer bar and buffer management)
- `<Space>e` - **Toggle File Tree** (Neo-tree)
- `<Space><Space>` - **Motion** (Flash.nvim jumps)

### Essential Keybinds

#### Buffer Bar
- `<Space>bn` - Next buffer
- `<Space>bp` - Previous buffer
- `<Space>bc` - Close buffer

#### File Navigation
- `<Space>e` - Toggle neo-tree file explorer
- `<Space>ff` - Find files (Telescope)
- `<Space>fg` - Live grep (search in files)
- `<Space>fb` - Find buffers
- `<Space>fh` - Help tags

#### Enhanced Motion (Flash.nvim)
- `<Space><Space>s` - Flash search (quick jump to any location)
- `<Space><Space>w` - Flash jump to word
- `<Space><Space>l` - Flash jump to line
- `<Space><Space>t` - Flash treesitter (jump to syntax nodes)

#### LSP
- `<Space>ld` - Go to definition
- `<Space>lr` - Find references
- `<Space>lR` - Rename symbol
- `<Space>lh` - Hover documentation
- `<Space>la` - Code action
- `<Space>lf` - Format buffer
- `<Space>lt` - Toggle Trouble

#### Git
- `<Space>gb` - Blame line
- `<Space>gd` - Open diff view
- `<Space>gp` - Preview hunk
- `<Space>gs` - Stage hunk
- `<Space>gu` - Undo stage
- `<Space>gr` - Reset hunk
- `]h` / `[h` - Next/previous hunk

#### AI Assistants
- `<Space>at` - Toggle Sidekick sidebar
- `<Space>ac` - Send buffer to Sidekick
- `<Space>ab` - Send selection to Sidekick (visual mode)

## AI Assistant Setup

### Sidekick.nvim

Sidekick provides a unified sidebar for any AI CLI tool with workspace context.

**Prerequisites:**
- Copilot LSP server (automatically included via nvf's native copilot module)
- AI CLI tools (install the ones you want to use):

**GitHub Copilot CLI:**
```bash
gh extension install github/gh-copilot
gh auth login
```

**Claude Code CLI:**
```bash
# Install from https://docs.anthropic.com/en/docs/claude-code
```

**Usage:**
- `<Space>at` - Toggle Sidekick sidebar
- `<Space>ac` - Send current buffer to Sidekick
- `<Space>ab` - Send visual selection to Sidekick

In the Sidekick sidebar, run commands directly:
- `gh copilot suggest "add error handling"`
- `gh copilot explain`
- `claude` (for Claude Code)
- Or any other AI CLI tool

Sidekick automatically includes your buffer content and workspace context, making AI assistance more accurate.

## Development Environments

This configuration includes **direnv** integration for automatic per-project development environments - no Docker needed!

### Automatic with direnv

Create an `.envrc` file in your project root:

```bash
use flake
# or
use nix
```

Allow it once:
```bash
direnv allow
```

Now when you open any file in that directory with Neovim, the environment from your `flake.nix` or `shell.nix` is automatically loaded. Your LSP, formatters, and tools will use the project-specific versions.

### Example Project Setup

```nix
# flake.nix
{
  description = "My Python project";
  
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  
  outputs = { nixpkgs, ... }: {
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = with nixpkgs.legacyPackages.x86_64-linux; [
        python311
        python311Packages.flask
        python311Packages.requests
      ];
    };
  };
}
```

With `.envrc`:
```bash
use flake
```

Open a Python file in this directory, and Neovim will automatically use Python 3.11 with Flask and requests available!

## Configuration Structure

The configuration is organized to **map directly to NVF's option hierarchy**, making it easy to reference the [official documentation](https://nvf.notashelf.dev/options.html):

```
config/
├── default.nix        # Main coordinator - imports all modules
├── options.nix        # vim.options, vim.globals (basic settings)
├── theme.nix          # vim.theme (color scheme)
├── statusline.nix     # vim.statusline (lualine)
├── tabline.nix        # vim.tabline (bufferline at top)
├── filetree.nix       # vim.filetree (neo-tree)
├── dashboard.nix      # vim.dashboard (alpha greeter)
├── ui.nix             # vim.ui, vim.visuals (borders, noice)
├── treesitter.nix     # vim.treesitter (syntax highlighting)
├── autocomplete.nix   # vim.autocomplete (blink.cmp)
├── lsp.nix            # vim.lsp (language server config)
├── languages.nix      # vim.languages (13 language configs)
├── telescope.nix      # vim.telescope (fuzzy finder)
├── git.nix            # vim.git (gitsigns)
├── utility.nix        # vim.utility (surround, undotree, comments)
├── binds.nix          # vim.binds, vim.keymaps (which-key + all keybinds)
└── extra.nix          # vim.extraPlugins (plugins not native to NVF)
```

### How to Customize

Each file corresponds to a section in the [NVF documentation](https://nvf.notashelf.dev/options.html). To customize:

1. **Find the feature** in NVF docs (e.g., `vim.theme.name`)
2. **Edit the corresponding file** (e.g., `theme.nix`)
3. **Rebuild**: `nix build && ./result/bin/nvim`

**Example**: Change theme from Gruvbox to Catppuccin:
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

### Native vs Extra Plugins

- **Native NVF options** (in dedicated files): Preferred when available - use NVF's built-in support
- **extra.nix**: Only for plugins that don't have NVF options (flash.nvim, copilot, claudecode, etc.)

## Customization

Fork and customize to your preferences:

1. **Clone or fork** this repository
2. **Edit config files** - each module in `config/` is independent:
   - Change theme? Edit `config/ui.nix`
   - Different keybinds? Edit `config/keybinds.nix`
   - Add/remove languages? Edit `config/languages.nix`
   - Adjust LSP settings? Edit `config/lsp.nix`
3. **Test locally**:
   ```bash
   nix build
   ./result/bin/nvim
   ```
4. **Push and use**:
   ```bash
   git remote set-url origin git@github.com:yourusername/neovim-flake.git
   git push
   nix run github:yourusername/neovim-flake
   ```

See [NVF documentation](https://nvf.notashelf.dev/) for all available options and configuration patterns.

### Example: Changing the Theme

Edit `config/ui.nix`:
```nix
vim.theme = {
  enable = true;
  name = "catppuccin";  # was "gruvbox"
  style = "mocha";
};
```

### Example: Adding a Language

Edit `config/languages.nix`:
```nix
vim.languages.zig = {
  enable = true;
  lsp.servers = ["zls"];
  format.type = ["zigfmt"];
};
```

## Verification

After building, verify everything works:

```bash
# Check version
./result/bin/nvim --version

# View generated config
./result/bin/nvf-print-config

# Check plugins loaded
./result/bin/nvim -c "checkhealth"
```

### Troubleshooting

**LSP not working?**
```vim
:LspInfo          " Check LSP status
:checkhealth lsp  " Diagnose issues
```

**Check which plugins loaded:**
```vim
:scriptnames      " List all loaded scripts
```

## Resources

- [NVF Documentation](https://nvf.notashelf.dev/) - Framework documentation
- [NVF Options Reference](https://notashelf.github.io/nvf/options) - All available options
- [NVF GitHub](https://github.com/NotAShelf/nvf) - Source repository
- [Neovim Documentation](https://neovim.io/doc/) - Core Neovim docs
- [Which-key.nvim](https://github.com/folke/which-key.nvim) - Keybind helper
- [Blink.cmp](https://github.com/Saghen/blink.cmp) - Completion engine
- [Flash.nvim](https://github.com/folke/flash.nvim) - Motion navigation
- [Sidekick.nvim](https://github.com/folke/sidekick.nvim) - AI CLI sidebar
- [GitHub CLI Copilot Extension](https://github.com/github/gh-copilot) - Copilot CLI
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) - Official CLI

## Tips & Tricks

- **Learn as you go**: Press `<Space>` and browse the which-key menu
- **Quick file navigation**: `<Space>ff` for files, `<Space>fg` for content
- **Flash jumps**: `<Space><Space>s` makes jumping anywhere instant
- **Format on save**: Already enabled - just save and your code formats
- **Git blame**: Enabled inline - see who wrote each line as you edit
- **Signature help**: Type function names and see parameter hints automatically
- **Multiple cursors**: Not included - use visual block mode (`Ctrl+v`) instead
- **Direnv**: Set up once per project, enjoy automatic environments forever

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Acknowledgments

- [NotAShelf](https://github.com/NotAShelf) for [NVF](https://github.com/NotAShelf/nvf) - the amazing Neovim configuration framework that makes this all possible
- [Saghen](https://github.com/Saghen) for [Blink.cmp](https://github.com/Saghen/blink.cmp) - blazing fast Rust-powered completion
- [folke](https://github.com/folke) for [which-key](https://github.com/folke/which-key.nvim) and [flash.nvim](https://github.com/folke/flash.nvim)
- All the incredible plugin authors and contributors in the Neovim ecosystem
- The Nix community for reproducible development environments

## Star History

If this helped you, consider giving it a star!
