return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = true },
		notifier = { enabled = false },
		picker = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },

		terminal = {
			win = {
				style = "terminal",
				wo = {
					winhighlight = "Normal:SnacksTerminalNormal",
					winbar = "", -- removes the winbar with the "1:"
				},
			},
		},
		words = { enabled = false },
	},
	keys = {
		{
			"<leader>t",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
	},
}
