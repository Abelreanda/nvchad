require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- NvimTree Toggle
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- Telescope Find Files
map("n", "<leader><leader>", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })

-- Comment toggle
map("n", "<C-/>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-/>", "gc", { desc = "toggle comment", remap = true })

-- Copilot Accept
map('i', '<C-l>', function ()
    vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })

-- Move lines in Normal mode
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Mover línea hacia arriba" })
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Mover línea hacia abajo" })

-- Move lines in Insert mode
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Mover línea hacia arriba" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Mover línea hacia abajo" })

-- Move lines in Visual mode
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Mover selección hacia arriba" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Mover selección hacia abajo" })

-- Explorador se habre con space+e
-- Disable mappings
local nomap = vim.keymap.del

-- Default toogle NvimTree mapping
nomap("n", "<C-n>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

