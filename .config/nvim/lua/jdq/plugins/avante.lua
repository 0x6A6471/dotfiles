return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = true,
	version = false,
	opts = {
		behaviour = {
			auto_suggestions = false,
		},
		provider = "claude",
		claude = {
			model = "claude-sonnet-4-20250514", -- Updated model name
			temperature = 0,
			max_tokens = 8192,
		},
	},
	build = vim.fn.has("win32") == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	config = function(_, opts)
		require("avante").setup(opts)

		-- After avante loads, configure blink.cmp with avante sources
		vim.schedule(function()
			local blink_cmp_ok, blink_cmp = pcall(require, "blink.cmp")
			if blink_cmp_ok and blink_cmp.config then
				-- Add avante sources to blink.cmp
				local current_config = blink_cmp.config.sources
				if current_config then
					-- Add avante sources to default sources
					vim.list_extend(current_config.default, { "avante_commands", "avante_mentions", "avante_files" })

					-- Add compat sources
					current_config.compat = current_config.compat or {}
					vim.list_extend(current_config.compat, { "avante_commands", "avante_mentions", "avante_files" })

					-- Add avante providers
					current_config.providers = current_config.providers or {}
					current_config.providers.avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 90,
						opts = {},
					}
					current_config.providers.avante_files = {
						name = "avante_files",
						module = "blink.compat.source",
						score_offset = 100,
						opts = {},
					}
					current_config.providers.avante_mentions = {
						name = "avante_mentions",
						module = "blink.compat.source",
						score_offset = 1000,
						opts = {},
					}
				end
			end
		end)
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"saghen/blink.compat", -- Ensure blink.compat loads before avante
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = {
				"yetone/avante.nvim",
			},
			opts = function(_, opts)
				opts.file_types = opts.file_types or { "markdown", "norg", "rmd", "org" }
				vim.list_extend(opts.file_types, { "Avante" })
			end,
		},
	},
}
