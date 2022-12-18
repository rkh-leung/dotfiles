-- Install packer
local M = {}

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
M.is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    M.is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
    return M
end

require("leptanian")
