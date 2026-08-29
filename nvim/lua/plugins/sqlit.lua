return {
  {
    "Maxteabag/sqlit.nvim",
    cmd = "Sqlit", -- Плагин загрузится лениво только при вызове этой команды
    opts = {}, -- Настройки по умолчанию
    keys = {
      {
        "<leader>D", -- Сочетание клавиш: Пробел + заглавная D
        function()
          require("sqlit").open()
        end,
        desc = "Database TUI (sqlit)",
      },
    },
  },
}
