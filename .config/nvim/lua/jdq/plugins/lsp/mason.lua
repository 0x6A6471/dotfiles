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
				border = "rounded",
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"cssls",
				"html",
				"lua_ls",
				"rescriptls",
				"tailwindcss",
				"ts_ls",
			},
			-- auto-install with lspconfig
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "black",
				"eslint",
				"eslint_d",
				-- "isort",
				"prettier",
				"stylua",
			},
		})
	end,
}
