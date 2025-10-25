return {
	-- {
	-- 	"datsfilipe/vesper.nvim",
	-- 	name = "vesper",
	-- 	config = function()
	-- 		require("vesper").setup({
	-- 			transparent = false, -- Boolean: Sets the background to transparent
	-- 			italics = {
	-- 				comments = true, -- Boolean: Italicizes comments
	-- 				keywords = false, -- Boolean: Italicizes keywords
	-- 				functions = false, -- Boolean: Italicizes functions
	-- 				strings = false, -- Boolean: Italicizes strings
	-- 				variables = false, -- Boolean: Italicizes variables
	-- 			},
	-- 			overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
	-- 			palette_overrides = {},
	-- 		})
	-- 		vim.cmd("colorscheme vesper")
	-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	--
	-- 		vim.cmd("hi NormalFloat guibg=#000000")
	--
	-- 		-- Add diagnostic underlines
	-- 		vim.cmd("hi DiagnosticUnderlineError guisp=#ff8080 gui=undercurl")
	-- 		vim.cmd("hi DiagnosticUnderlineWarn guisp=#ffc799 gui=undercurl")
	-- 		vim.cmd("hi DiagnosticUnderlineInfo guisp=#80aaff gui=undercurl")
	-- 		vim.cmd("hi DiagnosticUnderlineHint guisp=#a0a0a0 gui=undercurl")
	-- 	end,
	-- },
	{
		"bjarneo/ash.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme ash]])
			vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
			vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
			vim.cmd("hi DiagnosticFloatingError guifg=#ff8080")
			vim.cmd("hi DiagnosticFloatingWarn guifg=#ffc799")
			vim.cmd("hi DiagnosticFloatingInfo guifg=#80aaff")
			vim.cmd("hi DiagnosticFloatingHint guifg=#a0a0a0")

			-- add diagnostic underlines
			vim.cmd("hi DiagnosticUnderlineError guisp=#ff8080 gui=undercurl")
			vim.cmd("hi DiagnosticUnderlineWarn guisp=#ffc799 gui=undercurl")
			vim.cmd("hi DiagnosticUnderlineInfo guisp=#80aaff gui=undercurl")
			vim.cmd("hi DiagnosticUnderlineHint guisp=#a0a0a0 gui=undercurl")

			-- modifications
			vim.cmd("hi @string guifg=#7EAB8E")
			vim.cmd("hi @lsp.type.function guifg=#FFBE89")
			vim.cmd("hi @lsp.typemod.function.declaration guifg=#FFBE89")
			vim.cmd("hi @function guifg=#FFBE89")
			vim.cmd("hi @function.call guifg=#FFBE89")
		end,
	},
	-- {
	-- 	"slugbyte/lackluster.nvim",
	-- 	name = "lackluster",
	-- 	config = function()
	-- 		local lackluster = require("lackluster")
	-- 		local color = lackluster.color
	-- 		lackluster.setup({
	-- 			tweak_color = {
	-- 				lack = "#555555",
	-- 			},
	-- 			tweak_background = {
	-- 				normal = "none", -- hexcode
	-- 				telescope = color.gray1, -- telescope
	-- 				menu = color.gray1, -- nvim_cmp, wildmenu ... (bad idea to transparent)
	-- 				popup = color.gray1, -- lazy, mason, whichkey ... (bad idea to transparent)
	-- 			},
	-- 			tweak_highlight = {
	-- 				["@function"] = {
	-- 					overwrite = false,
	-- 					fg = "#FFBE89",
	-- 				},
	-- 				["tsxTagName"] = {
	-- 					overwrite = false,
	-- 					fg = "#FFBE89",
	-- 				},
	-- 				["DiagnosticWarn"] = {
	-- 					overwrite = false,
	-- 					fg = "#FFF2AF",
	-- 				},
	-- 				["DiagnosticVirtualTextWarn"] = {
	-- 					overwrite = false,
	-- 					fg = "#FFF2AF",
	-- 				},
	-- 				["DiagnosticError"] = {
	-- 					overwrite = false,
	-- 					fg = "#F57A7A",
	-- 				},
	-- 				["DiagnosticVirtualTextError"] = {
	-- 					overwrite = false,
	-- 					fg = "#F57A7A",
	-- 				},
	-- 				["DiagnosticUnderlineError"] = {
	-- 					overwrite = true, -- changed to true
	-- 					sp = "#F57a7a", -- sp = special/underline color
	-- 					undercurl = true, -- or set to true if you want curly underline
	-- 					underline = true,
	-- 				},
	-- 				["DiagnosticSignError"] = {
	-- 					overwrite = true,
	-- 					fg = "#F57a7a",
	-- 				},
	-- 			},
	-- 			tweak_syntax = {
	-- 				type = "#555555",
	-- 				string = "#7EAB8E",
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme lackluster")
	-- 	end,
	-- },
	-- {
	-- 	"chriskempson/base16-vim",
	-- 	lazy = false,
	-- 	priority = 1000, -- Higher priority to load before other themes
	-- 	config = function()
	-- 		vim.cmd("colorscheme base16-black-metal-gorgoroth")
	-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	--
	-- 		-- Make error highlighting more prominent
	-- 		vim.cmd("hi Error guifg=#ff5555 guibg=#330000 gui=bold")
	-- 		vim.cmd("hi ErrorMsg guifg=#ff5555 guibg=#330000 gui=bold")
	--
	-- 		-- For diagnostics (LSP errors/warnings)
	-- 		vim.cmd("hi DiagnosticError guifg=#ff5555 gui=underline,bold")
	-- 		vim.cmd("hi DiagnosticWarn guifg=#ffaa77 gui=underline,bold")
	-- 		vim.cmd("hi DiagnosticUnderlineError guisp=#ff5555 gui=undercurl")
	-- 		vim.cmd("hi DiagnosticUnderlineWarn guisp=#ffaa77 gui=undercurl")
	--
	-- 		-- Virtual text (inline error messages)
	-- 		vim.cmd("hi DiagnosticVirtualTextError guifg=#ff5555 guibg=#330000 gui=bold")
	-- 		vim.cmd("hi DiagnosticVirtualTextWarn guifg=#ffaa77 guibg=#332200 gui=bold")
	-- 	end,
	-- },
}
