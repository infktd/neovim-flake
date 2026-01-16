# vim.autocomplete - Completion engine (blink.cmp)
# Reference: https://nvf.notashelf.dev/options.html#vim.autocomplete
{
  config.vim.autocomplete.blink-cmp = {
    enable = true;
    setupOpts = {
      signature.enabled = true;
      keymap.preset = "default";
    };
  };
}
