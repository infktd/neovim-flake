# vim.git - Git integration (gitsigns)
# Reference: https://nvf.notashelf.dev/options.html#vim.git
# Note: diffview-nvim is in extra.nix since it's not native to NVF
{
  config.vim = {
    git = {
      enable = true;
      gitsigns = {
        enable = true;
        mappings = {
          blameLine = "<leader>gb";
          previewHunk = "<leader>gp";
          stageHunk = "<leader>gs";
          undoStageHunk = "<leader>gu";
          resetHunk = "<leader>gr";
          nextHunk = "]h";
          previousHunk = "[h";
        };
        setupOpts = {
          current_line_blame = true;
          current_line_blame_opts = {
            delay = 300;
            virt_text_pos = "eol";
          };
        };
      };
    };
    
    keymaps = [
      # DiffView is not native to nvf
      {
        key = "<leader>gd";
        mode = "n";
        action = "<cmd>DiffviewOpen<CR>";
        desc = "Open Diff View";
        silent = true;
      }
    ];
  };
}
