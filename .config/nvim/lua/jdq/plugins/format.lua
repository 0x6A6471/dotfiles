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
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "biome", "prettier", stop_after_first = true },
				javascriptreact = { "biome", "prettier", stop_after_first = true },
				json = { "biome", "prettier", stop_after_first = true },
				markdown = { "prettier" },
				typescript = { "biome", "prettier", stop_after_first = true },
				typescriptreact = { "biome", "prettier", stop_after_first = true },

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
