return {
  'copilotlsp-nvim/copilot-lsp',
  event = 'VimEnter',
  dependencies = {
    'nvim-lspconfig',
  },
  init = function()
    vim.g.copilot_nes_debounce = 500
    vim.g.copilot_filetypes = {
      markdown = false,
      md = false,
      c = true,
      cpp = true,
      h = true,
    }
    vim.lsp.enable 'copilot_ls'
    vim.keymap.set('n', '<tab>', function()
      -- Try to jump to the start of the suggestion edit.
      -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
      local _ = require('copilot-lsp.nes').walk_cursor_start_edit()
        or (require('copilot-lsp.nes').apply_pending_nes() and require('copilot-lsp.nes').walk_cursor_end_edit())
    end)

    -- Accept copilot suggestion in insert mode with <C-j>
    vim.keymap.set('i', '<C-j>', function()
      if vim.b[vim.api.nvim_get_current_buf()].nes_state then
        return require('copilot-lsp.nes').apply_pending_nes() and require('copilot-lsp.nes').walk_cursor_end_edit()
      end
      return '<C-j>'
    end, { expr = true })
  end,
  config = function()
    require('copilot-lsp').setup {
      nes = {
        move_count_threshold = 3, -- Clear after 3 cursor movements
      },
      filetypes = {
        markdown = false,
        md = false,
        c = true,
        cpp = true,
        h = true,
      },
    }
  end,
}
