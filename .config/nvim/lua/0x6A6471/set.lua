vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.mouse = "a"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

local function recover_deleted_cwd()
	if vim.uv.cwd() == nil then
		vim.api.nvim_set_current_dir(vim.env.HOME)
	end
end

-- Plugins such as Harpoon require a valid cwd when buffers change or Neovim exits.
recover_deleted_cwd()
vim.api.nvim_create_autocmd({ "BufLeave", "VimLeavePre" }, {
	group = vim.api.nvim_create_augroup("recover-deleted-cwd", { clear = true }),
	callback = recover_deleted_cwd,
})

-- terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- exit terminal mode
vim.api.nvim_set_keymap("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })

-- move between windows in terminal mode
vim.api.nvim_set_keymap("t", "<C-w>h", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-w>j", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-w>k", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-w>l", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

vim.opt.list = false
vim.opt.listchars = { tab = "→ ", eol = "↲", space = "·" }
