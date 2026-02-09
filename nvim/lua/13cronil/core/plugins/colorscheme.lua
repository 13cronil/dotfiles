return {
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000, -- Load before other plugins
    config = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
