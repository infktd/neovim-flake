# vim.tabline - Buffer/tab line at the top
# Reference: https://nvf.notashelf.dev/options.html#vim.tabline
{
  config.vim.tabline.nvimBufferline = {
    enable = true;
    mappings = {
      cycleNext = "<leader>bn";
      cyclePrevious = "<leader>bp";
      pick = "<leader>bc";
    };
    setupOpts = {
      options = {
        mode = "buffers";
        diagnostics = "nvim_lsp";
        show_buffer_close_icons = true;
        show_close_icon = false;
        separator_style = "slant";
      };
    };
  };
}
