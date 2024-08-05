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
map("n", "<leader>\\", ":vsp<CR>", opt)
-- 横分屏
map("n", "<leader>-", ":sp<CR>", opt)
-- 关闭当前
map("n", "<leader>w", "<C-w>c", opt)
-- 关闭其他
map("n", "<leader>o", "<C-w>o", opt)
-- Alt + hjkl 切换窗口
map("n", "<M-h>", "<C-w>h", opt)
map("n", "˙", "<C-w>h", opt)
map("n", "<M-j>", "<C-w>j", opt)
map("n", "∆", "<C-w>j", opt)
map("n", "<M-k>", "<C-w>k", opt)
map("n", "˚", "<C-w>k", opt)
map("n", "<M-l>", "<C-w>l", opt)
map("n", "¬", "<C-w>l", opt)
-- 窗口左右比例
map("n", "<leader>h", ":vertical resize +2<CR>", opt)
map("n", "<leader>l", ":vertical resize -2<CR>", opt)
-- 窗口上下比例
map("n", "<C-j>", ":resize -2<CR>", opt)
map("n", "<C-k>", ":resize +2<CR>", opt)

-- 文字模式
-- 删除单词
map('i', '<M-BS>', '<C-w>', opt)
map('n', '<M-BS>', 'db', opt)
-- terminal 模式
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "M-h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "˙", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "M-j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "∆", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "M-k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "˚", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "M-l", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "¬", [[ <C-\><C-N><C-w>l ]], opt)

map("n", "<C-f>", "8j", opt)
map("n", "<C-b>", "8k", opt)
map("n", "H", "4h", opt)
map("n", "J", "4j", opt)
map("n", "K", "4k", opt)
map("n", "L", "4l", opt)

map('n', '<M-m>', ':NvimTreeToggle<CR>', opt)

map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
map('n', '<C-w>', ':Bdelete!<CR>', opt)
map('n', '<leader>cl', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>ch', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>cc', ':BufferLinePickClose<CR>', opt)

map('n', '<M-p>', ':Telescope find_files<CR>', opt)
map('n', 'π', ':Telescope find_files<CR>', opt)
map('n', '<M-F>', ':Telescope live_grep<CR>', opt)
map('n', 'Ï', ':Telescope live_grep<CR>', opt)

-- lsp keys
-- local command_rename = '<cmd>lua vim.lsp.buf.rename()<CR>'
local command_rename = '<cmd>Lspsaga rename<CR>'
map('n', '<F2>', command_rename, opt)
map('n', '<F18>', command_rename, opt)
-- local command_code_action = '<cmd>lua vim.lsp.buf.code_action()<CR>'
local command_code_action = '<cmd>Lspsaga code_action<CR>'
map('n', '<M-.>', command_code_action, opt)
map('n', '≥', command_code_action, opt)
map('n', '<D-.>', command_code_action, opt)
local command_signature_help = '<cmd>lua vim.lsp.buf.signature_help()<CR>'
map('n', '<leader>.', command_signature_help, opt)
-- local command_definition = '<cmd>lua vim.lsp.buf.definition()<CR>'
local command_definition = '<cmd>Lspsaga preview_definition<CR>'
map('n', '<leader>b', command_definition, opt)
local command_type_definition = '<cmd>lua vim.lsp.buf.type_definition()<CR>'
map('n', '<leader>B', command_type_definition, opt)
local command_declaration = '<cmd>lua vim.lsp.buf.declaration()<CR>'
map('n', '<leader>I', command_declaration, opt)
local command_implementation = '<cmd>lua vim.lsp.buf.implementation()<CR>'
map('n', '<leader>i', command_implementation, opt)
-- local command_references = '<cmd>lua vim.lsp.buf.references()<CR>'
local command_references = '<cmd>Lspsaga finder<CR>'
map('n', '<leader>r', command_references, opt)
-- local command_hover = '<cmd>lua vim.lsp.buf.hover()<CR>'
local command_hover = ':<c-u>Lspsaga hover_doc<CR>'
map('n', '<leader>?', command_hover, opt)
-- 全局格式化快捷键
local command_format = '<cmd>lua vim.lsp.buf.format()<CR>'
map("n", "<leader>f", command_format, opt)
-- 光标悬停 n 毫秒后触发 lsp.buf.hover
-- vim.o.updatetime = 1000
-- vim.api.nvim_create_autocmd('CursorHold', {
--  pattern = '*',
--  callback = function()
-- vim.lsp.buf.hover()
--  end,
--})
-- local command_open_float = '<cmd>lua vim.diagnostic.open_float()<CR>'
local command_open_float = '<cmd>Lspsaga show_line_diagnostics<CR>'
map('n', '<leader>p', command_open_float, opt)
-- local command_goto_prev = '<cmd>lua vim.diagnostic.goto_prev()<CR>'
local command_goto_prev = '<cmd>Lspsaga diagnostic_jump_prev<CR>'
map('n', '<C-H>', command_goto_prev, opt)
-- local command_goto_next = '<cmd>lua vim.diagnostic.goto_next()<CR>'
local command_goto_next = '<cmd>Lspsaga diagnostic_jump_next<CR>'
map('n', '<C-L>', command_goto_next, opt)
