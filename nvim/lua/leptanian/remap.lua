vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<leader>so", ":source %<CR>")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever: yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>w", ":w <CR>")
vim.keymap.set("n", "<leader>q", ":q! <CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "J", "mzJ`z")            -- join line and retain cursor position
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line line/block up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line line/block down in visual mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- move down page and recenter
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- move up page and recenter
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })


-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set('n', 'v', 'm`v', opts)
-- vim.keymap.set('n', 'V', 'm`V', opts)
-- vim.keymap.set('n', '<C-V>', 'm`<C-v>', opts)
-- vim.keymap.set('x', '<Esc>', "<Esc>:keepjumps normal ``<cr>", opts)

-- Change the default singleline comment
vim.api.nvim_set_keymap('n', '?', ':Comment<CR>', { noremap = true, silent = false })

-- Change the visual mode multiline comment
vim.api.nvim_set_keymap('v', '?', ':CommentMore<CR>', { noremap = true, silent = false })

vim.keymap.set("", "<leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- Go to tab by number
vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')
vim.keymap.set('n', '<leader>0', ':tablast<cr>')
