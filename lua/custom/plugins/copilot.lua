return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      panel = {
        enabled = false, -- Disabled for blink-copilot integration
      },
      suggestion = {
        enabled = false, -- Disabled for blink-copilot integration
      },
      filetypes = {
        markdown = false,
        md = false,
        c = true,
        cpp = true,
        h = true,
        ['*'] = true, -- Enable for all other filetypes by default
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
    })
  end,
}