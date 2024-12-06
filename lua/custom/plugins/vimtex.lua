return {

  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  config = function()
    vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<cr>', { desc = 'Fuzzy find files in cwd' })
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    vim.g.vimtex_general_options = '-r @line @pdf @tex'
  end,
}
