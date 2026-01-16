# vim.extraPlugins - Plugins not natively supported by NVF
# Reference: https://nvf.notashelf.dev/options.html#vim.extraPlugins
# Use this for plugins that don't have dedicated NVF options
{pkgs, ...}: {
  config.vim = {
    # Enable copilot for LSP server (required by sidekick.nvim)
    # but disable all UI features since we use sidekick instead
    assistant.copilot = {
      enable = true;
      cmp.enable = false;
      setupOpts = {
        panel.enabled = false;
        suggestion.enabled = false;
      };
    };
    
    extraPlugins = {
      # Flash.nvim - Enhanced motion/navigation
      flash-nvim = {
        package = pkgs.vimPlugins.flash-nvim;
        setup = ''
          require('flash').setup({
            labels = "asdfghjklqwertyuiopzxcvbnm",
            search = {
              multi_window = true,
              forward = true,
              wrap = true,
            },
            jump = {
              autojump = false,
            },
            label = {
              uppercase = false,
              rainbow = {
                enabled = true,
              },
            },
          })
        '';
      };
      
      # Direnv - Automatic environment loading
      direnv-vim = {
        package = pkgs.vimPlugins.direnv-vim;
        setup = ''
          vim.g.direnv_silent_load = 1
        '';
      };
      
      # Diffview - Git diff viewer
      diffview-nvim = {
        package = pkgs.vimPlugins.diffview-nvim;
        setup = ''
          require('diffview').setup()
        '';
      };
      
      # Sidekick.nvim - AI CLI sidebar integration
      # NOTE: Requires copilot-language-server LSP (provided by vim.assistant.copilot above)
      # and AI CLI tools to be installed separately:
      # - GitHub Copilot CLI: gh extension install github/gh-copilot
      # - Claude Code CLI: https://docs.anthropic.com/en/docs/claude-code
      # - Or any other AI CLI tool (Aider, etc.)
      sidekick-nvim = {
        package = pkgs.vimPlugins.sidekick-nvim;
        setup = ''
          require('sidekick').setup({
            sidebar = {
              position = "right",
              width = 0.5,
            },
            buffer = {
              auto_attach = true,
            }, 
          })
        '';
      };
    };
  };
}
