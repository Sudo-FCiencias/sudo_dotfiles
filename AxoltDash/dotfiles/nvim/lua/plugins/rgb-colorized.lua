-- Add this to your Lazy.nvim configuration
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require 'colorizer'.setup()
  end
}
