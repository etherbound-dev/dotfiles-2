return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- vim.opt.background = 'light'
      vim.cmd.colorscheme 'catppuccin-latte'
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    end,
  },
}
