{
  config.vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;
    
    nix = {
      enable = true;
      lsp = {
        enable = true;
        servers = ["nil"];
      };
      format = {
        enable = true;
        type = ["alejandra"];
      };
      extraDiagnostics = {
        enable = true;
        types = ["statix" "deadnix"];
      };
    };
    
    python = {
      enable = true;
      lsp = {
        enable = true;
        servers = ["pyright"];
      };
      format = {
        enable = true;
        type = ["black"];
      };
    };
    
    rust = {
      enable = true;
      lsp.enable = true;
      format.enable = true;
    };
    
    ts = {
      enable = true;
      lsp.enable = true;
      format = {
        enable = true;
        type = ["prettier"];
      };
    };
    
    bash = {
      enable = true;
      lsp.enable = true;
      format = {
        enable = true;
        type = ["shfmt"];
      };
    };
    
    markdown = {
      enable = true;
      lsp.enable = true;
      format = {
        enable = true;
        type = ["prettierd"];
      };
    };
    
    go = {
      enable = true;
      lsp.enable = true;
      format = {
        enable = true;
        type = ["gofmt"];
      };
    };
    
    lua = {
      enable = true;
      lsp.enable = true;
      format = {
        enable = true;
        type = ["stylua"];
      };
    };
    
    html.enable = true;
    css.enable = true;
    json.enable = true;
    yaml.enable = true;
    toml.enable = true;
  };
}
