-- 模式：n - normal; i - insert; v visual; t terminal; c command;
-- vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- noremap: 禁止多重映射
-- silent: 减少输出多余信息
local opt = { noremap = true, silent = true }

-- 取消 s 默认功能（s：删除当前字符并进入 insert 模式）
map("n", "s", "", opt)
-- 取消 - 默认功能（-：类似 j 移动光标功能）
map("n", "-", "", opt)
-- 分屏快捷键
-- 竖分屏
map("n", "sv", ":vsp<CR>", opt)
-- 横分屏
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl 切换窗口
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 窗口左右比例
map("n", "<C-h>", ":vertical resize +2<CR>", opt)
map("n", "<C-l>", ":vertical resize -2<CR>", opt)
-- 窗口上下比例
map("n", "<C-j>", ":resize -2<CR>", opt)
map("n", "<C-k>", ":resize +2<CR>", opt)

-- terminal 模式
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "A-h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "A-j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "A-k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "A-l", [[ <C-\><C-N><C-w>l ]], opt)

map("n", "<C-f>", "8j", opt)
map("n", "<C-b>", "8k", opt)
map("n", "<A-H>", "4h", opt)
map("n", "<A-J>", "4j", opt)
map("n", "<A-K>", "4k", opt)
map("n", "<A-L>", "4l", opt)

map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)

map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
map('n', '<C-w>', ':Bdelete!<CR>', opt)
map('n', '<leader>bl', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>bh', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>bc', ':BufferLinePickClose<CR>', opt)

map('n', '<A-p>', ':Telescope find_files<CR>', opt)
map('n', '<A-F>', ':Telescope live_grep<CR>', opt)

