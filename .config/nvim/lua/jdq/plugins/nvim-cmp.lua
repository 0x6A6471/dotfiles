return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		lspkind.init({
			symbol_map = {
				Copilot = "",
			},
		})

		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

		local kind_formatter = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
			},
		})

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},
			snippet = { -- configure nvim-cmp with snippets
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(4), -- scroll up preview
				["<C-d>"] = cmp.mapping.scroll_docs(-4), -- scroll down preview
				["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
				["<C-c>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
				-- ["<C-j>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_next_item()
				-- 	elseif luasnip.locally_jumpable(1) then
				-- 		luasnip.jump(1)
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
				-- ["<C-k>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item()
				-- 	elseif luasnip.jumpable(-1) then
				-- 		luasnip.jump(-1)
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				-- { name = "copilot" }, -- copilot suggestions
				{ name = "supermaven" }, -- supermaven suggestions
				{ name = "nvim_lsp" }, -- lsp suggestions
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text buffer
				{ name = "path" }, -- fs paths
				{ name = "vim-dadbod-completion" }, -- db completion
			}),
			formatting = {
				fields = { "abbr", "kind", "menu" },
				expandable_indicator = true,
				format = function(entry, vim_item)
					-- Lspkind setup for icons
					vim_item = kind_formatter(entry, vim_item)

					-- Tailwind colorizer setup
					vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)

					return vim_item
				end,
			},
		})
	end,
}
