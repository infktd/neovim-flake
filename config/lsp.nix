{
  config.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      trouble.enable = true;
      null-ls.enable = true;
      mappings = {
        goToDefinition = "<leader>ld";
        listReferences = "<leader>lr";
        renameSymbol = "<leader>lR";
        hover = "<leader>lh";
        codeAction = "<leader>la";
        format = "<leader>lf";
      };
    };
    
    diagnostics.nvim-lint.enable = true;
  };
}
