return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				["ml-format"] = {
					command = "./_build/_private/default/.dev-tool/ocamlformat/ocamlformat/target/bin/ocamlformat",
					args = {
						"--enable-outside-detected-project",
						"--name",
						"$FILENAME",
						"-",
					},
				},
			},
			formatters_by_ft = {
				css = { "biome", "prettier" },
				html = { "biome", "prettier" },
				javascript = { "biome", "prettier" },
				javascriptreact = { "biome", "prettier" },
				json = { "biome", "prettier" },
				markdown = { "biome", "prettier" },
				typescript = { "biome", "prettier" },
				typescriptreact = { "biome", "prettier" },

				lua = { "stylua" },

				-- ocaml = { "ocamlformat" },
				ocaml = { "ml-format" },
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
