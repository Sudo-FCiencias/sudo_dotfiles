return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false, -- Esto mostrará archivos ocultos
					hide_dotfiles = false, -- Esto mostrará archivos que empiezan con punto
					hide_gitignored = true, -- esto mostrará archivos ignorados por .gitignore
				},
			},
		})
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left toggle<CR>", {})
		vim.keymap.set("n", "<leader>N", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
