return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local function get_start_dir(filename)
			if filename == "" then
				return vim.fn.getcwd()
			end
			return vim.fs.dirname(filename)
		end

		local function find_local_bin_from_file(filename, name)
			local dir = get_start_dir(filename)
			while dir ~= nil and dir ~= "" do
				local candidate = dir .. "/node_modules/.bin/" .. name
				if vim.fn.executable(candidate) == 1 then
					return candidate
				end

				local parent = vim.fs.dirname(dir)
				if parent == dir then
					break
				end
				dir = parent
			end
			return nil
		end

		lint.linters.oxlint.cmd = function()
			local filename = vim.api.nvim_buf_get_name(0)
			local local_oxlint = find_local_bin_from_file(filename, "oxlint")
			if local_oxlint then
				return local_oxlint
			end
			return "oxlint"
		end
		lint.linters_by_ft = {
			javascript = { "oxlint" },
			javascriptreact = { "oxlint" },
			typescript = { "oxlint" },
			typescriptreact = { "oxlint" },
			python = { "pylint" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
