return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      fzf_colors = false,
    })
  end,
  keys = {
    {
      "<leader>fs",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Live grep",
    },
  },
}
