return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
    -- stylua: ignore
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>lj", '<cmd>lua require("flash").jump()<cr>', { desc = "Flash jump" })
		keymap.set("n", "<leader>lt", '<cmd>lua require("flash").treesitter()<cr>', { desc = "Flash Treesitter" })
		keymap.set(
			"n",
			"<leader>lr",
			'<cmd>lua require("flash").treesitter_search()<cr>',
			{ desc = "Flash Treesitter Search" }
		)
	end,
}
