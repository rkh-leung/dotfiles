-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<leader>so", ":source %<CR>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>w", ":w <CR>")
vim.keymap.set("n", "<leader>q", ":q! <CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<A-i>", "<C-i>")
vim.keymap.set("n", "<A-o>", "<C-o>")

-- TODO: change it to a function
vim.keymap.set("v", "<backspace>a", '"ay')
vim.keymap.set("n", "<backspace>A", '"ap')
vim.keymap.set("v", "<backspace>s", '"sy')
vim.keymap.set("n", "<backspace>s", '"sp')
vim.keymap.set("v", "<backspace>d", '"dy')
vim.keymap.set("n", "<backspace>d", '"dp')
vim.keymap.set("v", "<backspace>f", '"fy')
vim.keymap.set("n", "<backspace>f", '"fp')

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever: yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "J", "mzJ`z") -- join line and retain cursor position
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line line/block up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line line/block down in visual mode
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down page and recenter
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move up page and recenter
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left><Left>")
vim.keymap.set("n", "<leader>b", ":3s/.*\\zs.*/\\=toupper(system('git rev-parse --abbrev-ref HEAD')[:-2])")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Go to tab by number
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tablast<cr>")

-- Not sure about nvim_set_keymap
-- Change the default singleline comment
vim.api.nvim_set_keymap("n", "?", ":Comment<CR>", { noremap = true, silent = false })

-- Change the visual mode multiline comment
-- vim.api.nvim_set_keymap("v", "?", ":CommentMore<CR>", { noremap = true, silent = false })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uick[F]ix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
