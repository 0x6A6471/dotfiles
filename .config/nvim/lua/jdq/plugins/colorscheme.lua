return {
	-- {
	-- 	"ramojus/mellifluous.nvim",
	-- 	name = "mellifluous",
	-- 	config = function()
	-- 		require("mellifluous").setup({
	-- 			transparent_background = {
	-- 				enabled = true,
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme mellifluous")
	-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	-- 	end,
	-- },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				no_italic = true,
				transparent_background = true,
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = true,
	-- 			terminal_colors = false,
	-- 			styles = {
	-- 				keywords = { italic = false },
	-- 				functions = { italic = false },
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi DiagnosticVirtualTextError guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi DiagnosticVirtualTextWarn guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi DiagnosticVirtualTextInfo guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi DiagnosticVirtualTextHint guibg=NONE ctermbg=NONE")
	-- 	end,
	-- },

	-- {
	-- 	"tjdevries/colorbuddy.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local colorbuddy = require("colorbuddy")
	-- 		local Color = colorbuddy.Color
	-- 		local colors = colorbuddy.colors
	-- 		local Group = colorbuddy.Group
	-- 		-- local groups = colorbuddy.groups
	-- 		local styles = colorbuddy.styles
	--
	-- 		Color.new("qwhite", "#ffffff")
	--
	-- 		Group.new("htmlTag", colors.yellow:light())
	-- 		Group.new("htmlTagName", colors.violet)
	-- 		Group.new("typescriptbraces", colors.qwhite)
	-- 		Group.new("typescriptEndColons", colors.qwhite)
	-- 		Group.new("typescriptCall", colors.qwhite)
	-- 		Group.new("typescriptStatementKeyword", colors.violet)
	-- 		Group.new("WinSeparator", nil, nil)
	--
	-- 		vim.cmd.colorscheme("gruvbuddy")
	-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	-- 	end,
	-- },
}
