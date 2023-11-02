return {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        border = "single",
        row = 0.05,    -- Changed from 0.3 to 0.1
        col = 0.15,   -- Changed from 0.25 to 0.15
        width = 0.7,  -- Changed from 0.5 to 0.7
        height = 0.8, -- Changed from 0.4 to 0.8,
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = true,
      confirm = false,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}
