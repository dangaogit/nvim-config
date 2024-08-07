local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  vim.notify('没有找到 nvim-treesitter')
  return
end

treesitter.setup({
  ensure_installed = { 'json', 'jsonc', 'html', 'css', 'vim', 'vimdoc', 'lua', 'javascript', 'typescript', 'tsx', 'vue', 'rust', 'go', 'java', 'python', 'yaml' },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = 'TAB',
    },
  },
  indent = {
    enable = true,
  },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
