return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		{
			"supermaven-inc/supermaven-nvim",
			dependencies = {
				{
					"saghen/blink.compat",
					version = "*",
					opts = {
						impersonate_nvim_cmp = true,
						debug = true,
					},
					-- Add this config to fix the avante.nvim warning
					config = function(_, opts)
						require("blink.compat").setup(opts)
						-- Monkey patch to handle cmp.setup.filetype calls from avante.nvim
						require("cmp").ConfirmBehavior = {
							Insert = "insert",
							Replace = "replace",
						}
						-- Add empty implementation for setup.filetype to suppress warning
						require("cmp").setup.filetype = function() end
					end,
				},
			},
		},
	},
	-- use a release tag to download pre-built binaries
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = "enter",
			-- show with a list of providers
			-- ["<C-s>"] = {
			-- 	function(cmp)
			-- 		cmp.show({ providers = { "snippets" } })
			-- 	end,
			-- },
		},
		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
			kind_icons = {
				Supermaven = "", -- or use a nerd font icon like ""
			},
		},
		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
		},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			-- Keep avante sources separate for now - they'll be added dynamically when avante loads
			default = { "supermaven", "lsp", "path", "snippets", "buffer" },
			providers = {
				supermaven = {
					name = "supermaven",
					module = "blink.compat.source",
					transform_items = function(_, items)
						local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
						local kind_idx = #CompletionItemKind + 1
						CompletionItemKind[kind_idx] = "Supermaven"
						for _, item in ipairs(items) do
							item.kind = kind_idx
						end
						return items
					end,
				},
			},
		},
		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
	config = function(_, opts)
		require("blink.cmp").setup(opts)

		vim.api.nvim_set_hl(0, "BlinkCmpKindSupermaven", {
			fg = "#6cc644",
		})
	end,
}
