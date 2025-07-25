return {
  {
    "theprimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-h>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-j>", function()
        ui.nav_file(1)
      end)
      vim.keymap.set("n", "<C-g>", function()
        ui.nav_file(2)
      end)
      vim.keymap.set("n", "<C-k>", function()
        ui.nav_file(3)
      end)
      vim.keymap.set("n", "<C-f>", function()
        ui.nav_file(4)
      end)
    end,
  },
}
