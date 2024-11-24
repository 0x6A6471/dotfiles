return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				markdown = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },

				lua = { "stylua" },

				ocaml = { "ocamlformat" },
				ocaml_mlx = { "ocamlformat_mlx" },

				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}
