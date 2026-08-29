return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                -- Указываем lua_ls, где искать типы Hyprland
                library = {
                  "/usr/share/hypr/stubs",
                },
              },
              diagnostics = {
                -- Отключаем ворнинг на главную переменную настроек Hyprland
                globals = { "hl" },
              },
            },
          },
        },
      },
    },
  },
}
