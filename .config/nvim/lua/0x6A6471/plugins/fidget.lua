return {
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			-- Turn on LSP, formatting, and linting status and progress information
			require("fidget").setup({
        text = {
        spinner = "moon",
      },
      align = {
        bottom = true,
      },
      window = {
        relative = "editor",
      },
		})
		end,
	},
}
