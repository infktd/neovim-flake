# vim.options, vim.globals - Basic Neovim settings
# Reference: https://nvf.notashelf.dev/options.html#vim.options
{
  config.vim = {
    # Leader key
    globals.mapleader = " ";
    
    # Enable vim/vi aliases
    viAlias = true;
    vimAlias = true;
    
    # Line numbers
    lineNumberMode = "relNumber";
    
    # Search settings
    searchCase = "smart";
    
    # Vim options
    options = {
      mouse = "a";
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      autoindent = true;
      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      clipboard = "unnamedplus";
      undofile = true;
      ignorecase = true;
      smartcase = true;
    };
  };
}
