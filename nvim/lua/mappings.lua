require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Python 開発用マッピング
map("n", "<leader>rr", function()
  require("nvchad.term").runner {
    pos = "sp",
    cmd = "python " .. vim.fn.expand('%:p'),
    clear_cmd = true,
    id = "pythonRunner",
  }
end, { desc = "Run Python file" })

map("n", "<leader>rt", function()
  require("nvchad.term").runner {
    pos = "sp",
    cmd = "pytest " .. vim.fn.expand('%:p'),
    clear_cmd = true,
    id = "pytestRunner",
  }
end, { desc = "Run pytest" })

map("n", "<leader>ri", function()
  require("nvchad.term").toggle {
    pos = "float",
    cmd = "python",
    id = "pythonREPL",
  }
end, { desc = "Open Python REPL" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
