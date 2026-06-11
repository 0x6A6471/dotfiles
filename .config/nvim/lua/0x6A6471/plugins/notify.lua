return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")

      notify.setup({
        background_colour = "#000000",
      })

      local filtered_message = { "No information available" }

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(message, level, opts)
        for _, msg in ipairs(filtered_message) do
          if message == msg then
            return
          end
        end
        return notify(message, level, opts)
      end
    end,
  },
}
