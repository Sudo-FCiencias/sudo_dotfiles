return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "lua", 
          "python", 
          "javascript", 
          "java", 
          "xml", 
          "latex", 
          "json", 
          "json5",
          "jsonc",
          "yaml",
          "html",
          "http",
          "css",
          "gdscript",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "c",
          "c_sharp",
          "cpp",
          "bash",
          "markdown",
          "markdown_inline",
          "haskell",
          "nix",
            "diff",
        }, -- Specify the languages you need
        highlight = {
          enable = true, -- Enable syntax highlighting
        },
        indent = {
          enable = true, disable = {"python", "css", "gdscript"} -- Enable and Disable indentation
        },
      })
    end,
  },
}
