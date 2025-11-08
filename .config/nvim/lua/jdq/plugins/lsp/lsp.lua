return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{ "j-hui/fidget.nvim", tag = "legacy" },
		"stevearc/conform.nvim",
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities().capabilities

		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.mlx",
			command = "setlocal filetype=ocaml_mlx",
		})

		local on_attach = function(client, bufner)
			local opts = { buffer = bufner, remap = false }
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float({ border = "rounded" })
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>rn", function()
				vim.lsp.buf.rename()
			end, opts)
		end

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("eslint", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
			root_dir = function()
				return vim.fn.stdpath("config")
			end,
		})

		vim.lsp.config("ocamllsp", {
			capabilities = capabilities,
			on_attach = on_attach,
			get_language_id = function(_, filetype)
				if filetype == "ocaml_mlx" then
					return "ocaml"
				end
				return filetype
			end,
			filetypes = {
				"ocaml",
				"ocaml_interface",
				"ocaml_mlx",
				"reason",
			},
			server_capabilities = {
				semanticTokensProvider = false,
			},
		})

		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.enable("clangd")
		vim.lsp.enable("cssls")
		vim.lsp.enable("html")
		vim.lsp.enable("eslint")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("ocamllsp")
		vim.lsp.enable("tailwindcss")
		vim.lsp.enable("ts_ls")
	end,
}
