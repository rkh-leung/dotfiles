local Remap = require("leptanian.keyfn")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>ee", ":Ex<CR>")
nnoremap("Y", "yg$")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever: yank to system clipboard
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("J", "mzJ`z")              -- join line and retain cursor position
vnoremap("J", ":m '>+1<CR>gv=gv")   -- move line line/block up in visual mode
vnoremap("K", ":m '<-2<CR>gv=gv")   -- move line line/block down in visual mode
nnoremap("<C-d>", "<C-d>zz")        -- move down page and recenter
nnoremap("<C-u>", "<C-u>zz")        -- move up page and recenter

nmap("<leader>vk", ":edit ~/.config/nvim/after/plugin/keymap/init.lua<CR>")
nmap("<leader>so", ":source %<CR>")

-- nnoremap("<leader>k", "<cmd>lnext<CR>zz")
-- nnoremap("<leader>j", "<cmd>lprev<CR>zz")
-- nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

