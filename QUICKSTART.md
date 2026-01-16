# Quick Start Guide

### Try it now (without installing):
```bash
./result/bin/nvim
```

### First-time setup inside Neovim:

1. **GitHub Copilot** (if you have a subscription):
   ```vim
   :Copilot auth
   ```
   Then use `<Space>ap` to open the Copilot panel

2. **Claude Code** (requires Claude Code CLI):
   - Install from: https://docs.anthropic.com/en/docs/claude-code
   - Then use `<Space>ac` for chat, `<Space>af` for fixes

3. **Discover keybinds**:
   - Press `<Space>` and wait - which-key will show you all options!
   - Common patterns:
     - `<Space>f` - Find things (files, grep, buffers)
     - `<Space>l` - LSP actions (definition, references, rename)
     - `<Space>g` - Git operations (blame, diff, stage)
     - `<Space>a` - AI assistants
     - `<Space><Space>` - Flash motion (quick jumps)

### Essential First Commands:

```vim
:checkhealth        " Verify all plugins are working
:Telescope          " See all available pickers
:help nvf           " Learn about NVF features
```

### Testing the setup:

1. Open the file tree: `<Space>e`
2. Find files: `<Space>ff`
3. Search in files: `<Space>fg`
4. Try flash motion: `<Space><Space>s` then type a word

### Language Server Testing:

Create a test file to verify LSP works:

**Python:**
```bash
echo 'def hello(name: str) -> str:
    return f"Hello {name}"

print(hello("World"))' > test.py

./result/bin/nvim test.py
# Try: <Space>lh (hover), <Space>lf (format)
```

**Rust:**
```bash
echo 'fn main() {
    println!("Hello, world!");
}' > test.rs

./result/bin/nvim test.rs
# Try: <Space>ld (go to definition of println)
```

### Integrating into your system:

**Option 1: Local test install**
```bash
# Add to your PATH temporarily
export PATH="$PWD/result/bin:$PATH"
nvim --version
```

**Option 2: Push to GitHub and use anywhere**
```bash
git remote add origin git@github.com:infktd/neovim-flake.git
git push -u origin main

# Then use from anywhere:
nix run github:infktd/neovim-flake
```

**Option 3: Add to your NixOS/Home-Manager config**

See [README.md](README.md) for detailed integration examples.

### Customization:

All config is in `config/` directory:
- Want different theme? Edit `config/ui.nix`
- Want different keybinds? Edit `config/keybinds.nix`
- Want more languages? Edit `config/languages.nix`

After changes:
```bash
nix build
./result/bin/nvim
```

### Troubleshooting:

**LSP not working?**
```vim
:LspInfo          " Check LSP status
:checkhealth lsp  " Diagnose LSP issues
```

**Plugins not loading?**
```vim
:checkhealth      " Check all plugins
:Lazy             " See lazy-loaded plugins (if any)
```

**Need to see the raw config?**
```bash
./result/bin/nvf-print-config | less
```

### Learning Resources:

- **NVF Documentation**: https://github.com/notashelf/nvf
- **Neovim Docs**: `:help` in Neovim
- **This Config's README**: [README.md](README.md)

### Have fun! 🚀

Remember: Press `<Space>` and wait to see all available commands!
