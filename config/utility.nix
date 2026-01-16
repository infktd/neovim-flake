# vim.utility - Utility plugins (surround, undotree, autopairs, comments)
# Reference: https://nvf.notashelf.dev/options.html#vim.utility
{
  config.vim = {
    utility = {
      surround.enable = true;
      undotree.enable = true;
    };
    
    comments.comment-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;
  };
}
