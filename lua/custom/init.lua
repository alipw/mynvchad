-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

vim.api.nvim_command "set nowrap"

vim.cmd [[
augroup GoImports
  autocmd!
  autocmd BufWritePre *.go :silent! exec "!goimports %"
augroup END
]]
