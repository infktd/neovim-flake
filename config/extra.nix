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
      # - Claude Code CLI: npm install -g @anthropic-ai/claude-code
      # - Or any other AI CLI tool (Aider, Codex, Gemini, etc.)
      sidekick-nvim = {
        package = pkgs.vimPlugins.sidekick-nvim;
        setup = ''
          require('sidekick').setup({
            cli = {
              mux = {
                enabled = true,
                backend = "zellij", -- or "tmux" if you use it
              },
            },
          })
          
          -- Keybindings for sidekick
          vim.keymap.set({'n', 't', 'i', 'x'}, '<C-.>', function() 
            require('sidekick.cli').toggle() 
          end, { desc = 'Sidekick Toggle CLI' })
          
          vim.keymap.set('n', '<leader>aa', function() 
            require('sidekick.cli').toggle() 
          end, { desc = 'Sidekick Toggle CLI' })
          
          vim.keymap.set('n', '<leader>as', function() 
            require('sidekick.cli').select() 
          end, { desc = 'Sidekick Select CLI' })
          
          vim.keymap.set('n', '<leader>ad', function() 
            require('sidekick.cli').close() 
          end, { desc = 'Sidekick Close CLI' })
          
          vim.keymap.set({'x', 'n'}, '<leader>at', function() 
            require('sidekick.cli').send({ msg = '{this}' }) 
          end, { desc = 'Send This to Sidekick' })
          
          vim.keymap.set('n', '<leader>af', function() 
            require('sidekick.cli').send({ msg = '{file}' }) 
          end, { desc = 'Send File to Sidekick' })
          
          vim.keymap.set('x', '<leader>av', function() 
            require('sidekick.cli').send({ msg = '{selection}' }) 
          end, { desc = 'Send Selection to Sidekick' })
          
          vim.keymap.set({'n', 'x'}, '<leader>ap', function() 
            require('sidekick.cli').prompt() 
          end, { desc = 'Sidekick Select Prompt' })
          
          -- Tab for Next Edit Suggestions (NES)
          vim.keymap.set('n', '<Tab>', function()
            if not require('sidekick').nes_jump_or_apply() then
              return '<Tab>'
            end
          end, { expr = true, desc = 'Goto/Apply Next Edit Suggestion' })
        '';
      };
    };
  };
}
