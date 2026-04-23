return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			local ts = require("nvim-treesitter")

			ts.setup()

			ts.install({
				"c",
				"eex",
				"elixir",
				"heex",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"ocaml",
				"ocaml_interface",
				"python",
				"query",
				"rust",
				"typescript",
				"tsx",
				"vim",
				"vimdoc",
			})

			local indent_disabled = {
				ocaml = true,
				ocaml_interface = true,
				ocaml_mlx = true,
			}

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					if not pcall(vim.treesitter.start, args.buf) then
						return
					end

					local filetype = vim.bo[args.buf].filetype
					if indent_disabled[filetype] then
						return
					end

					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
