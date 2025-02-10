require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = 'top', border = true },

      -- other layout configuration here
    },
    border = true,
    -- borderchars = {
    --   prompt = { "x", "y", "p", "t", "╭", "╮", "│", "│" },
    --   results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
    --   preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- },
    -- other defaults configuration here
  },
  -- other configuration values here
})
