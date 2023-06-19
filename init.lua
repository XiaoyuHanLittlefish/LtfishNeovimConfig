-- normal settings
-- 显示绝对行号
vim.o.number = true
-- 显示相对行号
vim.o.relativenumber = true
-- yy复制到剪贴板中
vim.o.clipboard = "unnamed"
-- yy复制后高亮
vim.api.nvim_create_autocmd({"TextYankPost"}, {
	pattern = {"*"}, 
	callback = function()
		vim.highlight.on_yank({
			timeout = 300, 
		}) 
	end,
})

-- keybindings
local opt = {noremap = true, silent = true}
vim.g.mapleader = " "
-- 分屏切换
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
-- 分屏创建
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)
-- 可视行跳转
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], {noremap = true, expr = true})
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], {noremap = true, expr = true})

-- 安装 lazy.nvim
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
require("lazy").setup({})

