local languages = {
	"c",
	"css",
	"eex",
	"elixir",
	"heex",
	"html",
	"javascript",
	"lua",
	"markdown",
	"markdown_inline",
	"ocaml",
	"ocaml_interface",
	"python",
	"query",
	"rust",
	"svelte",
	"typescript",
	"tsx",
	"vim",
	"vimdoc",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
					if
						language
						and language ~= "markdown"
						and language ~= "markdown_inline"
						and vim.list_contains(languages, language)
					then
						pcall(vim.treesitter.start, args.buf, language)
					end
				end,
			})
		end,
	},
}
