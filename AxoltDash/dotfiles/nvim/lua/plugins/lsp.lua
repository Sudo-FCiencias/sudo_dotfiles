return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
	{
	  "neovim/nvim-lspconfig",
	  lazy = false,
	  config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- Configuraciones personalizadas para cada LSP (opcional)
		vim.lsp.config('tsserver', {
		  capabilities = capabilities
		})
		vim.lsp.config('solargraph', {
		  capabilities = capabilities
		})
		vim.lsp.config('html', {
		  capabilities = capabilities
		})
		vim.lsp.config('lua_ls', {
		  capabilities = capabilities
		})

		-- Habilitar los servidores (esto activa el LSP para sus filetypes)
		vim.lsp.enable('tsserver')
		vim.lsp.enable('solargraph')
		vim.lsp.enable('html')
		vim.lsp.enable('lua_ls')

		-- === LSP KEYMAPS ===
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

		-- === DIAGNOSTIC KEYMAPS ===
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico flotante" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir al diagnóstico anterior" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir al siguiente diagnóstico" })
		vim.keymap.set("n", "<leader>q", function()
		  for _, win in ipairs(vim.fn.getwininfo()) do
			if win.loclist == 1 then
			  vim.cmd("lclose")
			  return
			end
		  end
		  vim.diagnostic.setloclist()
		end, { desc = "Toggle lista de diagnósticos" })
	  end,
	},
}
