local IS_DEV = false

local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	-- Setup copilot.vim
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			-- DISBALE COPILOR BY DEFAULT
			vim.g.copilot_enabled = false

			-- For copilot.vim
			-- enable copilot for specific filetypes
			vim.g.copilot_filetypes = {
				["TelescopePrompt"] = false,
			}

			-- Set to true to assume that copilot is already mapped
			vim.g.copilot_assume_mapped = true
			-- Set workspace folders
			vim.g.copilot_workspace_folders = "~/Projects"

			-- Setup keymaps
			local keymap = vim.keymap.set
			local opts = { silent = true }

			-- Set <C-y> to accept copilot suggestion
			keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

			-- Set <C-i> to accept line
			keymap("i", "<C-i>", "<Plug>(copilot-accept-line)", opts)

			-- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
			keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
			keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)
			keymap("i", "<C-l>", "<Plug>(copilot-suggest)", opts)

			-- Set <C-d> to dismiss suggestion
			keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)

			-- KAY DISABLE AND ENABLE COPILOT:
			-- Toggle global Copilot in all "normal" buffers
			local function copilot_set_global(enabled)
				vim.g.copilot_enabled = enabled

				local skip_ft = {
					["TelescopePrompt"] = true,
					["neo-tree"] = true,
					["NvimTree"] = true,
					["help"] = true,
					["lazy"] = true,
					["alpha"] = true,
					["gitcommit"] = true,
					["gitrebase"] = true,
					["dap-repl"] = true,
				}
				local skip_bt = {
					["nofile"] = true,
					["prompt"] = true,
					["terminal"] = true,
					["quickfix"] = true,
				}

				local cmd = enabled and "Copilot enable" or "Copilot disable"

				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_loaded(bufnr) then
						local bt = vim.api.nvim_buf_get_option(bufnr, "buftype")
						if not skip_bt[bt] then
							local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
							if ft ~= "" and not skip_ft[ft] then
								vim.api.nvim_buf_call(bufnr, function()
									pcall(vim.cmd, cmd)
								end)
							end
						end
					end
				end

				local msg = enabled and "Copilot ENABLED globally" or "Copilot DISABLED globally"
				pcall(vim.notify, msg, vim.log.levels.INFO, { title = "GitHub Copilot" })
			end

			local function copilot_toggle_global()
				copilot_set_global(not vim.g.copilot_enabled)
			end

			-- Set <leader>ag to toggle Copilot globally
			keymap("n", "<leader>ag", copilot_toggle_global, { silent = true, desc = "Copilot: toggle global" })
		end,
	},
	-- { import = "plugins.extras.copilot-vim" }, -- Or use { import = "lazyvim.plugins.extras.coding.copilot" },
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			spec = {
				{ "<leader>a", group = "ai" },
				{ "gm", group = "+Copilot chat" },
				{ "gmh", desc = "Show help" },
				{ "gmd", desc = "Show diff" },
				{ "gmp", desc = "Show system prompt" },
				{ "gms", desc = "Show selection" },
				{ "gmy", desc = "Yank diff" },
				{ "gmd", desc = "Show diff" },
				{ "gmp", desc = "Show system prompt" },
				{ "gms", desc = "Show selection" },
				{ "gmy", desc = "Yank diff" },
			},
		},
	},
	{
		dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil,
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main", -- Use the canary branch if you want to test the latest features but it might be unstable
		-- version = "v3.1.0",
		-- Do not use branch and version together, either use branch or version
		dependencies = {
			{ "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			question_header = "## User ",
			answer_header = "## Copilot ",
			error_header = "## Error ",
			prompts = prompts,
			auto_follow_cursor = false, -- Don't follow the cursor after getting response
			chat_autocomplete = true, -- Enable chat autocomplete
			mappings = {
				-- Use tab for completion
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "<Tab>",
				},
				-- Close the chat
				close = {
					normal = "q",
					insert = "<C-c>",
				},
				-- Reset the chat buffer
				reset = {
					normal = "<C-x>",
					insert = "<C-x>",
				},
				-- Submit the prompt to Copilot
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
				-- Accept the diff
				accept_diff = {
					normal = "<C-y>",
					insert = "<C-y>",
				},
				-- Yank the diff in the response to register
				yank_diff = {
					normal = "gmy",
				},
				-- Show the diff
				show_diff = {
					normal = "gmd",
				},
				-- Show the prompt
				show_info = {
					normal = "gmp",
				},
				-- Show the user selection
				show_context = {
					normal = "gms",
				},
				-- Show help
				show_help = {
					normal = "gmh",
				},
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			local select = require("CopilotChat.select")
			-- Use unnamed register for the selection
			opts.selection = select.unnamed

			chat.setup(opts)

			vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
				chat.ask(args.args, { selection = select.visual })
			end, { nargs = "*", range = true })

			-- Inline chat with Copilot
			vim.api.nvim_create_user_command("CopilotChatInline", function(args)
				chat.ask(args.args, {
					selection = select.visual,
					window = {
						layout = "float",
						relative = "cursor",
						width = 1,
						height = 0.4,
						row = 1,
					},
				})
			end, { nargs = "*", range = true })

			-- Restore CopilotChatBuffer
			vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
				chat.ask(args.args, { selection = select.buffer })
			end, { nargs = "*", range = true })

			-- Custom buffer for CopilotChat
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt_local.relativenumber = true
					vim.opt_local.number = true

					-- Get current filetype and set it to markdown if the current filetype is copilot-chat
					local ft = vim.bo.filetype
					if ft == "copilot-chat" then
						vim.bo.filetype = "markdown"
					end
				end,
			})
		end,
		event = "VeryLazy",
		keys = {
			-- Show prompts actions with telescope
			{
				"<leader>ap",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
			},
			{
				"<leader>ap",
				":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
				mode = "x",
				desc = "CopilotChat - Prompt actions",
			},
			-- Code related commands
			{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
			{ "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
			{ "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
			-- Chat with Copilot in visual mode
			{
				"<leader>av",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ax",
				":CopilotChatInline<cr>",
				mode = "x",
				desc = "CopilotChat - Inline chat",
			},
			-- Custom input for CopilotChat
			{
				"<leader>ai",
				function()
					local input = vim.fn.input("Ask Copilot: ")
					if input ~= "" then
						vim.cmd("CopilotChat " .. input)
					end
				end,
				desc = "CopilotChat - Ask input",
			},
			-- Generate commit message based on the git diff
			{
				"<leader>am",
				"<cmd>CopilotChatCommit<cr>",
				desc = "CopilotChat - Generate commit message for all changes",
			},
			-- Quick chat with Copilot
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						vim.cmd("CopilotChatBuffer " .. input)
					end
				end,
				desc = "CopilotChat - Quick chat",
			},
			-- Debug
			{ "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
			-- Fix the issue with diagnostic
			{ "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix Diagnostic" },
			-- Clear buffer and chat history
			{ "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
			-- Toggle Copilot Chat Vsplit
			{ "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
			-- Copilot Chat Models
			{ "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
		},
	},
}
