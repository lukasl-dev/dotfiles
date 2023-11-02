-- Show a column at 80 characters
vim.opt.colorcolumn = "80"

-- Disable persistent undo
vim.opt.undofile = false

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Use Powershell as default shell on Windows
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.o.shell = 'powershell'
  vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
  vim.o.shellquote = '\"'
  vim.o.shellxquote = ''
end
