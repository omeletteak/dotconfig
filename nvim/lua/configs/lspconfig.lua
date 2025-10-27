local nvchad_lsp = require("nvchad.configs.lspconfig")

-- NvChadのデフォルトLSP設定を読み込み
nvchad_lsp.defaults()

-- ===== 一般LSPの有効化 =====
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("pyright")
vim.lsp.enable("stylua")

-- ===== sqls専用設定 =====
local cwd = vim.fn.getcwd()
local db_files = vim.fn.glob(cwd .. "/*.db", false, true)

local connections = {}
for _, db in ipairs(db_files) do
  table.insert(connections, {
    driver = "sqlite3",
    dataSourceName = vim.fn.fnamemodify(db, ":p"), -- 絶対パス化
  })
end

vim.lsp.config("sqls", {
  cmd = { "sqls" },
  root_dir = cwd,
  settings = {
    sqls = { connections = connections },
  },
})
vim.lsp.enable("sqls")