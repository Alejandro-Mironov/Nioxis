return {
  'gelguy/wilder.nvim',
  build = ':UpdateRemotePlugins',
  config = function()
    local wilder = require 'wilder'
    wilder.setup { modes = { ':', '/', '?' } }
  end,
}
