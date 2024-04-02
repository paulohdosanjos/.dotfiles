local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-autopairs'
  use "lukas-reineke/indent-blankline.nvim" 
  use 'lervag/vimtex'
  use 'famiu/bufdelete.nvim' 
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use "christoomey/vim-tmux-navigator"
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  
  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP

  use { -- simple to use language server installer
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions
  use "nvim-lua/plenary.nvim"
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "ThePrimeagen/harpoon"

  --colorschemes
  use "dasupradyumna/midnight.nvim"
  use "rebelot/kanagawa.nvim"
  use 'ellisonleao/gruvbox.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
   "jesseleite/nvim-noirbuddy",
   requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
  }


  use { 
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end
  }

  use 'shaunsingh/nord.nvim'

  use 'AlexvZyl/nordic.nvim'

  use 'jonblow-copy'  -- custom theme attempting to copy jon blow emacs theme

  use 'rktjmp/lush.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
