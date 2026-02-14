return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				border = "single",
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"cssls",
				"eslint",
				"html",
				"lua_ls",
				"tailwindcss",
				-- "ts_ls",
			},
			highlight = true,
			-- auto-install with lspconfig
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"eslint_d",
				"stylua",
			},
		})
	end,
}
