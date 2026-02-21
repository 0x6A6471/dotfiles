return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local function file_exists(filename)
			local f = io.open(filename, "r")
			if f ~= nil then
				io.close(f)
				return true
			else
				return false
			end
		end
		local function get_project_root()
			return vim.fn.getcwd()
		end
		local function get_web_formatters()
			local root = get_project_root()

			-- check for biome config
			if file_exists(root .. "/biome.json") or file_exists(root .. "/biome.jsonc") then
				return { "biome-check" }
			end

			return { "prettier" }
		end
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
				mix = {
					command = "mix",
					args = { "format", "--stdin-filename", "$FILENAME", "-" },
					stdin = true,
				},
			},
			formatters_by_ft = {
				css = get_web_formatters(),
				html = get_web_formatters(),
				javascript = get_web_formatters(),
				javascriptreact = get_web_formatters(),
				json = get_web_formatters(),
				markdown = get_web_formatters(),
				typescript = get_web_formatters(),
				typescriptreact = get_web_formatters(),
				lua = { "stylua" },
				ocaml = { "ml-format" },
				ocaml_mlx = { "ocamlformat_mlx" },
				python = { "isort", "black" },
				elixir = { "mix" },
				eelixir = { "mix" },
				heex = { "mix" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}
