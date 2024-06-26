local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 自我管理
    use 'wbthomason/packer.nvim'
    -- 主题
    use 'folke/tokyonight.nvim'
    -- 侧边
    use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
  end,
  config = {
    display = {
       open_fn = function()
        return require("packer.util").float({ border = "single" })
       end,
    },
  }
})

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
