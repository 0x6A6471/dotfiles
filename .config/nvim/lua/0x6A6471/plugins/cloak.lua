return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
		})

		vim.keymap.set({ "n" }, "<LEADER>ct", require("cloak").toggle, { silent = true, noremap = true })
	end,
}
