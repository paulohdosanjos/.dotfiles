local window = function()
  return vim.api.nvim_win_get_number(0)
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'powerline_dark',
  },
  sections = {
    lualine_a = {
        window,
      {
        'filename',
        path = 1,
      }
    }
  },
  inactive_sections = {
      lualine_a = { window },
    },
}
