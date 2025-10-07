return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark" -- or "light" for light mode
            require("gruvbox").setup({
                palette_overrides = {
                    dark0_hard = "#121110",
                    dark0 = "#222222",
                    dark0_soft = "#282826",
                    dark1 = "#2e2d29",
                    dark2 = "#39372f",
                    dark3 = "#504b3b",
                    dark4 = "#675f47",

                    light0 = "#f2e5bc",
                    light1 = "#d7c483",
                    light2 = "#c1b077",
                    light3 = "#aa9c6b",
                    light4 = "#94885f",

                    bright_red = "#b36d43",
                    bright_green = "#78824b",
                    bright_yellow = "#c9a554",
                    bright_blue = "#6e937f",
                    bright_purple = "#c88493",
                    bright_aqua = "#5f875f",
                    bright_orange = "#b87e40",

                    neutral_red = "#a65b2e",
                    neutral_green = "#687338",
                    neutral_yellow = "#b69240",
                    neutral_blue = "#538369",
                    neutral_purple = "#b16878",
                    neutral_aqua = "#4b764b",
                    neutral_orange = "#ad702e",
                }
            })
            vim.cmd([[colorscheme gruvbox]])
            vim.cmd([[
                highlight Normal ctermbg=none guibg=none
                highlight NonText ctermbg=none guibg=none
            ]])
            -- Definir grupos para fondos sólidos
            vim.api.nvim_set_hl(0, 'NormalSolid', { bg = '#141413' })
            vim.api.nvim_set_hl(0, 'NonTextSolid', { bg = '#141413' })

            -- Autocomandos para ventana activa (código)
            vim.api.nvim_create_autocmd('WinEnter', {
                callback = function()
                    if vim.bo.filetype ~= 'neo-tree' then
                        vim.wo.winhighlight = 'Normal:NormalSolid,NonText:NonTextSolid'
                    end
                end
            })

            vim.api.nvim_create_autocmd('WinLeave', {
                callback = function()
                    vim.wo.winhighlight = 'Normal:Normal,NonText:NonText'
                end
            })

        end,
    },
    -- {
    --     "xero/miasma.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd("colorscheme miasma")
    --     end,
    -- }
}
