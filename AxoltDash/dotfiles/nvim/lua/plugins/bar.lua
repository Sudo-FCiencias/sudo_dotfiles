return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox-material',
        disabled_filetypes = { 'packer', 'NVimTree', 'neo-tree', 'copilot-chat' },
      },
    }
  end
}
