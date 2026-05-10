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
		local function get_project_root_from_file(filename)
			if filename == "" then
				return vim.fn.getcwd()
			end
			local dirname = vim.fs.dirname(filename)
			local root = vim.fs.root(dirname, {
				"package.json",
				"biome.json",
				"biome.jsonc",
				".git",
			})
			return root or dirname
		end

		local function get_project_root(bufnr)
			local filename = vim.api.nvim_buf_get_name(bufnr)
			return get_project_root_from_file(filename)
		end

		local function has_local_bin(root, name)
			return vim.fn.executable(root .. "/node_modules/.bin/" .. name) == 1
		end

		local function get_web_formatters(bufnr)
			local root = get_project_root(bufnr)
			if has_local_bin(root, "oxfmt") then
				return { "oxfmt" }
			end
			if file_exists(root .. "/biome.json") or file_exists(root .. "/biome.jsonc") then
				return { "biome-check" }
			end
			return { "prettier" }
		end

		conform.setup({
			formatters = {
				oxfmt = {
					command = function(_, ctx)
						local root = get_project_root_from_file(ctx.filename)
						local local_oxfmt = root .. "/node_modules/.bin/oxfmt"
						if vim.fn.executable(local_oxfmt) == 1 then
							return local_oxfmt
						end
						return "oxfmt"
					end,
					args = { "--stdin-filepath", "$FILENAME" },
					stdin = true,
				},
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
				css = get_web_formatters,
				html = get_web_formatters,
				javascript = get_web_formatters,
				javascriptreact = get_web_formatters,
				json = get_web_formatters,
				markdown = get_web_formatters,
				typescript = get_web_formatters,
				typescriptreact = get_web_formatters,
				lua = { "stylua" },
				ocaml = { "ml-format" },
				ocaml_mlx = { "ocamlformat_mlx" },
				python = { "isort", "black" },
				-- elixir = { "mix" },
				-- eelixir = { "mix" },
				-- heex = { "mix" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}
