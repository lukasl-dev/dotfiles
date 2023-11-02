local M = {}

M.go_list = {
  n = {
    ["<leader>fgt"] = {
      function()
        require('go-list').find_tests()
      end,
      "Find Go test files",
    },
    ["<leader>fgtr"] = {
      function()
        require('go-list').find_and_run_test()
      end,
      "Find and run Go test"
    },
  }
}
return M
