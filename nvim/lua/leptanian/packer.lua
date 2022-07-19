-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- Themes
    use { "ellisonleao/gruvbox.nvim" }
    use { "artart222/nvim-enfocado" }
    use { "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
        }

    use { "nvim-lua/plenary.nvim" }
    use { "nvim-lua/popup.nvim" }
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = 'make' }

    use { "ggandor/lightspeed.nvim" }

    use { "williamboman/nvim-lsp-installer" }
    use { "neovim/nvim-lspconfig" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/nvim-cmp" }
    use { "onsails/lspkind-nvim" }
    use { "nvim-lua/lsp_extensions.nvim" }
    use { "glepnir/lspsaga.nvim" }
    use { "simrat39/symbols-outline.nvim" }
    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { "mbbill/undotree" }

    use { "ThePrimeagen/harpoon" }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-treesitter/nvim-treesitter-context" }

    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui" }
    use { "theHamsta/nvim-dap-virtual-text" }
end)
