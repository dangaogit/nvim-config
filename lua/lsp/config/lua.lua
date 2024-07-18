local opts = {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    print('load config from ' .. path .. '.luarc.jsonc')
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '.luarc.jsonc') then
      print('load config from ' .. path .. '.luarc.jsonc')
      return
    end

    client.config.settings.lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
}

return {
  on_setup = function(lsp_server)
    lsp_server.setup(opts)
  end,
}
