return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "j-hui/fidget.nvim", tag = "legacy" },
		"stevearc/conform.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

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
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
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
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig.lexical.setup({})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- lspconfig["ocamllsp"].setup({
		-- 	manual_install = true,
		-- 	cmd = { "dune", "tools", "exec", "ocamllsp" },
		-- 	-- cmd = { "dune", "exec", "ocamllsp" },
		-- 	settings = {
		-- 		codelens = { enable = true },
		-- 		inlayHints = { enable = true },
		-- 		syntaxDocumentation = { enable = true },
		-- 	},
		--
		-- 	server_capabilities = { semanticTokensProvider = false },
		--
		-- 	-- TODO: Check if i still need the filtypes stuff i had before
		-- })

		lspconfig["ocamllsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			get_language_id = function(_, filetype)
				-- vim.notify(filetype)
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

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["racket_langserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["rescriptls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
