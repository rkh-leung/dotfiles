-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})
-- Create an autocmd group for your custom highlights
local custom_hl_augroup = vim.api.nvim_create_augroup("CustomHighlights", { clear = true })

-- Create an autocmd group
-- local local_augroup = vim.api.nvim_create_augroup("name", { clear = true })
-- vim.api.nvim_create_autocmd("filetype", {
--   group = local_augroup,
--   pattern = { }, -- trigger for specific files
--   callback = function ()
--     vim.fn.setreg("l", "", options?)
--   end
-- })

-- Autocmd to set custom highlights after the colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
	group = custom_hl_augroup,
	callback = function()
		-- Set the foreground color for the Comment highlight group
		-- Choose a color hex code that is more visible against your background.
		-- Examples:
		--   "#808080" - Standard gray (might already be this)
		--   "#A0A0A0" - Lighter gray
		--   "#98C379" - Soft green (like One Dark)
		--   "#61AFEF" - Soft blue
		--   "#E5C07B" - Soft yellow/orange

		-- *** Choose your desired color here ***
		local comment_color = "#A0A0A0" -- Example: a lighter gray

		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC" })
		-- vim.api.nvim_set_hl(0, 'LineNr', { fg='gold', bold=true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F" })
		vim.api.nvim_set_hl(0, "Comment", { fg = comment_color })
	end,
})
