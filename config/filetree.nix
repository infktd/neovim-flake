# vim.filetree - File explorer (neo-tree)
# Reference: https://nvf.notashelf.dev/options.html#vim.filetree
{
  config.vim.filetree.neo-tree = {
    enable = true;
    setupOpts = {
      close_if_last_window = true;
      enable_git_status = true;
      enable_diagnostics = true;
      window.position = "left";
      window.width = 30;
    };
  };
}
