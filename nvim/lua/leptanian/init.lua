local augroup = vim.api.nvim_create_augroup
LepGroup = augroup("Leptanian", {})

require("leptanian.options")
require("leptanian.packer")

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
--     group = LepGroup,
--     pattern = "*.rs",
--     callback = function()
--         require("lsp_extensions").inlay_hints{}
--     end
-- })

autocmd({"BufWritePre"}, {
    group = LepGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50

