# Main configuration coordinator
# Each module maps to a specific vim.* option in NVF
# Reference: https://nvf.notashelf.dev/options.html
{
  imports = [
    ./options.nix        # vim.options, vim.globals (basic settings)
    ./theme.nix          # vim.theme
    ./statusline.nix     # vim.statusline
    ./tabline.nix        # vim.tabline (bufferline)
    ./filetree.nix       # vim.filetree
    ./dashboard.nix      # vim.dashboard
    ./ui.nix             # vim.ui, vim.visuals
    ./treesitter.nix     # vim.treesitter
    ./autocomplete.nix   # vim.autocomplete
    ./lsp.nix            # vim.lsp
    ./languages.nix      # vim.languages
    ./telescope.nix      # vim.telescope
    ./git.nix            # vim.git
    ./utility.nix        # vim.utility
    ./binds.nix          # vim.binds, vim.keymaps
    ./extra.nix          # vim.extraPlugins (for non-native plugins)
  ];
}
