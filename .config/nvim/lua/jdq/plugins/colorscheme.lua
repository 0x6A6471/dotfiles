return {
	{
		"slugbyte/lackluster.nvim",
		name = "lackluster",
		config = function()
			local lackluster = require("lackluster")
			local color = lackluster.color
			lackluster.setup({
				tweak_background = {
					normal = "none", -- hexcode
					telescope = color.gray1, -- telescope
					menu = color.gray1, -- nvim_cmp, wildmenu ... (bad idea to transparent)
					popup = color.gray1, -- lazy, mason, whichkey ... (bad idea to transparent)
				},
				tweak_highlight = {
					["@function"] = {
						overwrite = false,
						fg = color.yellow,
					},
					-- ["Constant"] = {
					-- 	overwrite = false,
					-- 	fg = color.orange,
					-- },
					["DiagnosticWarn"] = {
						overwrite = false,
						fg = "#ffaa88",
					},
					["DiagnosticVirtualTextWarn"] = {
						overwrite = false,
						fg = "#ffaa88",
					},
				},
				tweak_syntax = {
					type = "#7788aa",
					string = color.green,
				},
			})
			vim.cmd("colorscheme lackluster")
		end,
	},

	-- {
	-- 	"tjdevries/colorbuddy.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local colorbuddy = require("colorbuddy")
	-- 		local Color = colorbuddy.Color
	-- 		local colors = colorbuddy.colors
	-- 		local Group = colorbuddy.Group
	--
	-- 		Color.new("qwhite", "#ffffff")
	--
	-- 		-- ocaml
	-- 		Group.new("@lsp.type.function.ocaml_mlx", colors.violet)
	--
	-- 		-- js land
	-- 		Group.new("htmlTag", colors.yellow:light())
	-- 		Group.new("htmlTagName", colors.violet)
	-- 		Group.new("typescriptbraces", colors.qwhite)
	-- 		Group.new("typescriptEndColons", colors.qwhite)
	-- 		Group.new("typescriptCall", colors.qwhite)
	-- 		Group.new("tsxAttrib", colors.yellow:light())
	-- 		Group.new("typescriptStatementKeyword", colors.violet)
	-- 		Group.new("typescriptVariable", colors.violet)
	-- 		Group.new("WinSeparator", nil, nil)
	--
	-- 		-- racket
	-- 		Group.new("racketsyntax", colors.violet)
	--
	-- 		vim.cmd.colorscheme("gruvbuddy")
	-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	-- 	end,
	-- },
}
