vim = vim

-- AXOLTDASH --------------------------------------------------------
vim.opt.termguicolors = true    --Disbale error

-- Line numbers and relative line numbers
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true     -- Show relative line numbers

-- Set leader key
vim.g.mapleader = " "            -- Set leader key to comma

-- Enable mouse support
vim.opt.mouse = "a"               -- Enable mouse in all modes

-- Tab and indentation
vim.opt.expandtab = false        -- Convert tabs to spaces
vim.opt.tabstop = 4              -- A Tab character displays as 2 spaces
vim.opt.softtabstop = 4          -- Pressing Tab or Backspace inserts/removes 2 spaces
vim.opt.shiftwidth = 4           -- Auto-indent uses 2 spaces

-- dd in black hole
vim.keymap.set("n", "dd", [["_dd]], { noremap = true, desc = "Borrar línea sin afectar portapapeles" })

-- Lazi Nvim
require("config.lazy")

-- AUTO COMENT DISABLE ----------------------------------------------
-- autocmd("FileType", {
--   pattern = "*",
--   callback = function()
--     -- Disable comment on new line
--     vim.opt.formatoptions:remove { "c", "o" }
-- 
--   end,
--   group = general,
--   desc = "Disable New Line Comment",
-- })

-- PROLOG ------------------------------------------------------------
-- Renember: Delete lsp.lua COQ provider
vim.cmd('source ~/.config/nvim/lua/semen4/prolog.vim')
local syntax_path = '~/.config/nvim/lua/semem4/prolog.vim'
vim.cmd('silent! source ' .. syntax_path)

-- TABS --------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-q>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<A-p>',   '<Cmd>BufferPick<CR>', opts)
map('n', '<A-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
