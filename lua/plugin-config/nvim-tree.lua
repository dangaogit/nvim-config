local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
  vim.notify('未找到插件 nvim-tree')
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

nvim_tree.setup({
  sort = {
    sorter = 'case_sensitive',
  },
  view = {
    width = 30,
    signcolumn = 'no',
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = false,
  },
})

