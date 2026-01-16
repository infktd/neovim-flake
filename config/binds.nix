# vim.binds, vim.keymaps - Keybindings and which-key
# Reference: https://nvf.notashelf.dev/options.html#vim.binds
# Note: Native nvf mappings are used for:
# - LSP mappings in lsp.nix
# - Telescope mappings in telescope.nix  
# - Git (gitsigns) mappings in git.nix
# - Tabline (bufferline) mappings in tabline.nix
# Neo-tree doesn't have native mappings, so its keybind is here
{
  config.vim = {
    binds.whichKey = {
      enable = true;
      setupOpts = {
        preset = "modern";
        notify = true;
        win.border = "rounded";
      };
      register = {
        "<leader>f" = "+ Find";
        "<leader>l" = "+ LSP";
        "<leader>g" = "+ Git";
        "<leader>a" = "+ AI/Sidekick";
        "<leader>c" = "+ Code";
        "<leader>b" = "+ Buffer";
        "<leader>e" = "Toggle File Tree";
        "<leader><leader>" = "+ Motion";
      };
    };
    
    keymaps = [
      # File tree (neo-tree doesn't have native nvf mappings)
      {
        key = "<leader>e";
        mode = "n";
        action = "<cmd>Neotree toggle<CR>";
        desc = "Toggle File Tree";
        silent = true;
      }
      {
        key = "<leader>lt";
        mode = "n";
        action = "<cmd>TroubleToggle<CR>";
        desc = "Toggle Trouble";
        silent = true;
      }
      
      # Flash motion keybinds (from extra.nix)
      {
        key = "<leader><leader>w";
        mode = ["n" "x" "o"];
        action = "<cmd>lua require('flash').jump({ pattern = vim.fn.expand('<cword>') })<CR>";
        desc = "Flash Word";
        silent = true;
      }
      {
        key = "<leader><leader>l";
        mode = ["n" "x" "o"];
        action = "<cmd>lua require('flash').jump({ search = { mode = 'search', max_length = 0 }, label = { after = { 0, 0 } }, pattern = '^' })<CR>";
        desc = "Flash Line";
        silent = true;
      }
      {
        key = "<leader><leader>t";
        mode = ["n" "x" "o"];
        action = "<cmd>lua require('flash').treesitter()<CR>";
        desc = "Flash Treesitter";
        silent = true;
      }
      {
        key = "<leader><leader>s";
        mode = ["n" "x" "o"];
        action = "<cmd>lua require('flash').jump()<CR>";
        desc = "Flash Search";
        silent = true;
      }
      
      # Note: Sidekick keybinds are defined in extra.nix setup string
      # because they require Lua function calls
    ];
  };
}
