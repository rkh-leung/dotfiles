return {
	-- == Completion Setup ==
	-- 1. Snippet Engine (LuaSnip) and its cmp source (cmp_luasnip)
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Use a specific version if desired
		build = "make install_jsregexp", -- Build command if needed for regex support
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Common dependency for snippet icons
		event = "InsertEnter", -- Load when entering Insert mode
		config = function()
			-- Setup your snippet loaders here. vscode is a common format.
			require("luasnip.loaders.from_vscode").lazy_load()
			-- Add any other LuaSnip configuration (like keymaps for snippet editing) here
		end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
		-- This is just the source, no config usually needed for the source itself.
		-- Ensure it loads after nvim-cmp and LuaSnip.
		dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" },
		event = "InsertEnter", -- Or dependsOn = 'nvim-cmp'
	},

	-- 2. nvim-cmp (The Completion Engine)
	{
		"hrsh7th/nvim-cmp",
		version = false, -- Keep version false as in original, or specify a tag
		event = "InsertEnter", -- Load when entering Insert mode
		dependencies = {
			-- List all *sources* and *related plugins* cmp needs to work with
			"hrsh7th/cmp-nvim-lsp", -- LSP source
			"hrsh7th/cmp-buffer", -- Buffer source
			"hrsh7th/cmp-path", -- Path source
			"hrsh7th/cmp-nvim-lsp-signature-help", -- Signature help source
			"saadparwaiz1/cmp_luasnip", -- Snippet source (depends on LuaSnip)
			"folke/lazydev.nvim", -- LazyVim Dev source (uncomment if you use this)
		},
		config = function()
			-- This function runs *after* nvim-cmp and its dependencies are loaded

			local cmp = require("cmp")
			local luasnip = require("luasnip") -- Required for snippet keymaps
			-- local lspkind = require('lspkind') -- Optional: for enhanced formatting with icons/text
			local defaults = require("cmp.config.default")() -- Get default options

			-- Set the highlight for ghost text (optional, can also go in autocmds.lua)
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

			-- Determine auto_select behavior (adjust logic as needed)
			local auto_select = true -- Keep it true like LazyVim often does

			cmp.setup({
				-- Removed LazyVim's custom 'auto_brackets' option as it requires their helper
				completion = {
					-- If auto_select is true, 'noinsert' is not needed. If false, add ',noinsert,noselect'.
					completeopt = "menu,menuone" .. (auto_select and "" or ",noinsert,noselect"),
				},
				preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,

				mapping = cmp.mapping.preset.insert({
					-- Scroll documentation window
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Basic selection (Optional if using <Tab>/<S-Tab> for selection)
					-- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					-- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

					-- Manually trigger completion
					["<C-Space>"] = cmp.mapping.complete(),

					-- Confirmation mappings (using standard cmp.mapping.confirm)
					-- ["<CR>"] = cmp.mapping.confirm({ select = auto_select }), -- Accept currently selected item
					["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item, even if auto_select is false
					["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Replace text with selected item

					-- Abort completion and fallback
					["<C-CR>"] = function(fallback)
						cmp.abort()
						fallback()
					end,

					-- Combined <Tab> and <S-Tab> for completion and snippets
					-- Requires LuaSnip and cmp_luasnip
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							-- If completion menu is visible, select the next item
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						elseif luasnip.expand_or_jumpable() then
							-- If not visible, and current position can expand or jump forward in a snippet
							luasnip.expand_or_jump()
						else
							-- Otherwise, fallback to the default Tab behavior (e.g., inserting spaces/tab)
							fallback()
						end
					end, { "i", "s" }), -- Apply this mapping in Insert and Snippet modes

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							-- If completion menu is visible, select the previous item
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						elseif luasnip.jumpable(-1) then
							-- If not visible, and current position can jump backward in a snippet
							luasnip.jump(-1)
						else
							-- Otherwise, fallback to the default Shift-Tab behavior
							fallback()
						end
					end, { "i", "s" }), -- Apply this mapping in Insert and Snippet modes
				}),

				-- Completion Sources configuration - order matters for suggestion priority
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Suggestions from LSP server
					{ name = "luasnip" }, -- Suggestions from snippets
					{ name = "buffer" }, -- Suggestions from open buffers
					{ name = "path" }, -- Suggestions for file paths
					{ name = "lazydev" }, -- Suggestions for LazyVim development (uncomment if used)
					-- Add other sources you want here
					-- { name = "cmdline" },
					-- { name = "nvim_lua" },
				}),

				-- Formatting of completion items in the menu
				formatting = {
					format = function(entry, item)
						-- Simple format: just show the kind and the completion word
						-- If you have nvim-web-devicons installed, you can add icons:
						-- local icons = require('nvim-web-devicons').get_icons() or {}
						-- local kind_icon = icons[item.kind] or ' ' -- Get icon for the kind
						-- item.kind = kind_icon .. item.kind -- Prepend icon to kind text

						-- Ensure item kind is visible (example formatting)
						item.kind = string.format("[%s]", item.kind) -- e.g., "[Text]"

						-- Removed LazyVim's custom width truncation logic using vim.g.cmp_widths

						return item
					end,
				},

				experimental = {
					-- Ghost text (inline completion preview)
					-- LazyVim tied this to vim.g.ai_cmp. Set to false or {} if not using an
					-- AI source that provides ghost text, or if you don't want it always.
					ghost_text = false, -- Set to { hl_group = "CmpGhostText" } to enable always
				},

				-- Keeping the default sorting logic
				sorting = defaults.sorting,

				-- Add other cmp options from the default kickstart setup if needed
				-- window = { ... },
				-- documentation = { ... },
			})
		end,
		-- Removed: main = "lazyvim.util.cmp"
	},

	-- == Individual Completion Sources (These are dependencies of nvim-cmp,
	--    but need their own specs in the list) ==
	{
		"hrsh7th/cmp-nvim-lsp",
		-- No config usually needed, just ensure it loads after nvim-cmp
		dependencies = { "hrsh7th/nvim-cmp" },
		event = "InsertEnter", -- Or dependsOn = 'nvim-cmp'
	},
	{
		"hrsh7th/cmp-buffer",
		-- No config usually needed
		dependencies = { "hrsh7th/nvim-cmp" },
		event = "InsertEnter", -- Or dependsOn = 'nvim-cmp'
	},
	{
		"hrsh7th/cmp-path",
		-- No config usually needed
		dependencies = { "hrsh7th/nvim-cmp" },
		event = "InsertEnter", -- Or dependsOn = 'nvim-cmp'
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
		-- No config usually needed
		dependencies = { "hrsh7th/nvim-cmp" },
		event = "InsertEnter", -- Or dependsOn = 'nvim-cmp'
	},

	-- == Other potentially relevant plugins ==
	-- If you want icons in your completion menu or other places, you'll likely need this:
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true, -- Load only when needed (LuaSnip dependency or similar event)
	},
}
