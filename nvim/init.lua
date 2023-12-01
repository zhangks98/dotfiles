local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- IMPORTANT: Must come after plugins are loaded.
require("lsp")
require("diagnostics")

if vim.fn.exists('+termguicolors') then
  vim.opt.termguicolors = true
end

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set indentation.
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.api.nvim_create_augroup('setCommentString', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = 'setCommentString',
  pattern = { 'c', 'cpp', 'cs', 'java' },
  command = 'setlocal commentstring=//\\ %s'
})