# vim.telescope - Fuzzy finder
# Reference: https://nvf.notashelf.dev/options.html#vim.telescope
{
  config.vim.telescope = {
    enable = true;
    mappings = {
      findFiles = "<leader>ff";
      liveGrep = "<leader>fg";
      buffers = "<leader>fb";
      helpTags = "<leader>fh";
    };
    setupOpts = {
      defaults = {
        layout_strategy = "horizontal";
        layout_config = {
          horizontal = {
            prompt_position = "top";
            preview_width = 0.55;
          };
          width = 0.87;
          height = 0.80;
        };
        sorting_strategy = "ascending";
      };
    };
  };
}
