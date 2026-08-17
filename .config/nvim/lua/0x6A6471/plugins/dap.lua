return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.4 },
						{ id = "breakpoints", size = 0.2 },
						{ id = "stacks", size = 0.2 },
						{ id = "watches", size = 0.2 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
		})
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local ok, koda = pcall(require, "koda")
		local palette = ok and koda.get_palette("dark") or {}

		vim.api.nvim_set_hl(0, "DapBreakpointSymbol", { fg = palette.danger or "#e51400" })
		vim.api.nvim_set_hl(0, "DapConditionSymbol", { fg = palette.warning or "#e5c07b" })
		vim.api.nvim_set_hl(0, "DapRejectedSymbol", { fg = palette.comment or "#848b98" })
		vim.api.nvim_set_hl(0, "DapLogPointSymbol", { fg = palette.success or "#98c379" })
		vim.api.nvim_set_hl(0, "DapStoppedSymbol", { fg = palette.warning or "#ffcc00" })
		vim.api.nvim_set_hl(0, "DapBreakpointLine", { bg = palette.red or "#402020" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "●", texthl = "DapBreakpointSymbol", numhl = "DapBreakpointSymbol" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "●", texthl = "DapConditionSymbol", numhl = "DapConditionSymbol" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "○", texthl = "DapRejectedSymbol", numhl = "DapRejectedSymbol" }
		)
		vim.fn.sign_define("DapLogPoint", { text = "●", texthl = "DapLogPointSymbol", numhl = "DapLogPointSymbol" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "→", texthl = "DapStoppedSymbol", linehl = "DapBreakpointLine", numhl = "DapStoppedSymbol" }
		)

		-- GDB adapter (C/C++/Rust)
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on", "--eval-command", "set print address on" },
		}
		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
				args = {},
			},
			{
				name = "Attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
		}
		dap.configurations.cpp = dap.configurations.c
		dap.configurations.rust = dap.configurations.c

		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end)

		vim.keymap.set("n", "<Leader>dn", dap.step_over)
		vim.keymap.set("n", "<Leader>ds", dap.step_into)
		vim.keymap.set("n", "<Leader>dS", dap.step_out)
		vim.keymap.set("n", "<Leader>dc", dap.continue)
		vim.keymap.set("n", "<Leader>dt", dap.terminate)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.terminate(nil, nil, function()
				dap.run_last()
			end)
		end)
		vim.keymap.set("n", "<Leader>dw", function()
			require("dapui").elements.watches.add()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>de", function()
			require("dapui").eval()
		end)
	end,
}
