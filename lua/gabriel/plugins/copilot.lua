return {

	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					next = "<C-]>",
					prev = "<C-[>",
					dismiss = "<C-c>",
				},
			},
			filetypes = {
				markdown = true,
				help = true,
				gitcommit = true,
				lua = true,
				python = true,
				cpp = true,
				["*"] = false, -- Disable Copilot by default for all other filetypes
			},
		})
	end,
}
