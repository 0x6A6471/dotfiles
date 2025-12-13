return {
	-- {
	-- 	"bjarneo/ash.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme ash]])
	-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	-- 		vim.cmd("hi DiagnosticFloatingError guifg=#ff8080")
	-- 		vim.cmd("hi DiagnosticFloatingWarn guifg=#ffc799")
	-- 		vim.cmd("hi DiagnosticFloatingInfo guifg=#80aaff")
	-- 		vim.cmd("hi DiagnosticFloatingHint guifg=#a0a0a0")
	--
	-- 		-- add diagnostic underlines
	-- 		vim.cmd("hi DiagnosticUnderlineError guisp=#ff8080 gui=undercurl")
	-- 		vim.cmd("hi DiagnosticUnderlineWarn guisp=#ffc799 gui=undercurl")
	-- 		vim.cmd("hi DiagnosticUnderlineInfo guisp=#80aaff gui=undercurl")
	-- 		vim.cmd("hi DiagnosticUnderlineHint guisp=#a0a0a0 gui=undercurl")
	--
	-- 		-- modifications
	-- 		vim.cmd("hi @string guifg=#7EAB8E")
	-- 		vim.cmd("hi @lsp.type.function guifg=#FFBE89")
	-- 		vim.cmd("hi @lsp.typemod.function.declaration guifg=#FFBE89")
	-- 		vim.cmd("hi @function guifg=#FFBE89")
	-- 		vim.cmd("hi @function.call guifg=#FFBE89")
	--
	-- 		-- Terminal colors (16 ANSI colors)
	-- 		vim.g.terminal_color_0 = "#000000" -- black
	-- 		vim.g.terminal_color_1 = "#ff8080" -- red (git deletions)
	-- 		vim.g.terminal_color_2 = "#7EAB8E" -- green (git additions, strings)
	-- 		vim.g.terminal_color_3 = "#FFBE89" -- yellow/orange (functions)
	-- 		vim.g.terminal_color_4 = "#80aaff" -- blue (info)
	-- 		vim.g.terminal_color_5 = "#c792ea" -- magenta/purple
	-- 		vim.g.terminal_color_6 = "#89ddff" -- cyan
	-- 		vim.g.terminal_color_7 = "#cccccc" -- white/gray
	-- 		vim.g.terminal_color_8 = "#555555" -- bright black (gray)
	-- 		vim.g.terminal_color_9 = "#ff8080" -- bright red
	-- 		vim.g.terminal_color_10 = "#7EAB8E" -- bright green
	-- 		vim.g.terminal_color_11 = "#ffc799" -- bright yellow (warnings)
	-- 		vim.g.terminal_color_12 = "#80aaff" -- bright blue
	-- 		vim.g.terminal_color_13 = "#c792ea" -- bright magenta
	-- 		vim.g.terminal_color_14 = "#89ddff" -- bright cyan
	-- 		vim.g.terminal_color_15 = "#ffffff" -- bright white
	-- 	end,
	-- },
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local palette = require("zenbones.palette")
			vim.cmd("colorscheme zenbones")

			-- remove bold from all highlights
			local function remove_bold_from_all()
				local groups = vim.fn.getcompletion("", "highlight")
				for _, group in ipairs(groups) do
					local hl = vim.api.nvim_get_hl(0, { name = group })
					if hl.bold then
						hl.bold = false
						vim.api.nvim_set_hl(0, group, hl)
					end
				end
			end
			remove_bold_from_all()

			vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
			vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })

			local bg = vim.o.background
			local leaf_color = palette[bg].leaf.hex

			vim.api.nvim_set_hl(0, "@string", { fg = leaf_color })
			vim.api.nvim_set_hl(0, "String", { fg = leaf_color })
		end,
	},
}
