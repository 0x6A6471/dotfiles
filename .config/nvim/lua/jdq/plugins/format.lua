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

		local function get_start_dir(filename)
			if filename == "" then
				return vim.fn.getcwd()
			end
			return vim.fs.dirname(filename)
		end

		local function find_local_bin_from_file(filename, name)
			local dir = get_start_dir(filename)
			while dir ~= nil and dir ~= "" do
				local candidate = dir .. "/node_modules/.bin/" .. name
				if vim.fn.executable(candidate) == 1 then
					return candidate
				end

				local parent = vim.fs.dirname(dir)
				if parent == dir then
					break
				end
				dir = parent
			end
			return nil
		end

		local function has_oxfmt_config(filename)
			local config = vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts" }, {
				path = get_start_dir(filename),
				upward = true,
			})[1]
			return config ~= nil
		end

		local function get_web_formatters(bufnr)
			local filename = vim.api.nvim_buf_get_name(bufnr)
			local root = get_project_root(bufnr)
			if find_local_bin_from_file(filename, "oxfmt") or has_oxfmt_config(filename) then
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
						local local_oxfmt = find_local_bin_from_file(ctx.filename, "oxfmt")
						if local_oxfmt then
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
