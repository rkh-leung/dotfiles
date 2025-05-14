return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"rust",
				"go",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
			textobjects = {
				select = {
					enable = true, -- Set to true to enable text objects for selection (va, vi, etc.)
					-- Optional: You can limit textobjects to specific filetypes
					-- disable = { "lua" },

					-- Configure the keymaps for textobjects.
					-- These mappings work in operator-pending mode (e.g., d{keys}) and visual mode (e.g., v{keys}).
					keymaps = {
						-- Function text objects
						["af"] = "@function.outer", -- Select/delete/yank around a function
						["if"] = "@function.inner", -- Select/delete/yank inside a function
						-- Class text objects (example)
						["ac"] = "@class.outer", -- Select/delete/yank around a class
						["ic"] = "@class.inner", -- Select/delete/yank inside a class
						-- Add other text objects you want to use (blocks, loops, conditionals, etc.)
						-- See the plugin's documentation or `:help nvim-treesitter-textobjects-textobjects`
						-- for a list of available objects and how to map them.
					},
					-- Optional: Set linewise or blockwise select behavior (see plugin docs)
					-- linewise = true,
					-- blockwise = false,
				},
				-- Optional: You can also enable other textobject modules like 'move' and 'swap'
				-- move = {
				--   enable = true,
				--   ... keymaps for moving between objects (e.g., ]f, [f)
				-- },
				-- swap = {
				--   enable = true,
				--   ... keymaps for swapping objects (e.g., saa, sia)
				-- },
			},
		},
		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	},
	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
