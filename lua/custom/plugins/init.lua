-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

-- See the kickstart.nvim README for more information

--vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor/Cursor'

-- https://github.com/nvim-tree/nvim-tree.lua
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- vim.cmd 'colorscheme default-light:'
return {
  --  {
  --    'catppuccin/nvim',
  --    name = 'catppuccin',
  --    priority = 1000,
  --    config = function()
  --      ---@diagnostic disable-next-line: missing-fields
  --      --require('tokyonight').setup {
  --      --   styles = {
  --      --    comments = { italic = false }, -- Disable italics in comments
  --      --    },
  --      --}
  --
  --      -- Load the colorscheme here.
  --      -- Like many other themes, this one has different styles, and you could load
  --      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --      --vim.cmd.colorscheme 'catppuccin-latte'
  --    end,
  --  },
  --  {
  --    'nyoom-engineering/oxocarbon.nvim',
  --    config = function()
  --      --vim.opt.background = 'light' -- set this to dark or light
  --      --vim.cmd.colorscheme 'oxocarbon'
  --    end,
  --    -- Add in any other configuration;
  --    --   event = foo,
  --    --   config = bar
  --    --   end,
  --  },

  -- Problems with other plugins, like dadbod-ui:
  --  {
  --    'rmagatti/auto-session',
  --    lazy = false,
  --
  --    ---enables autocomplete for opts
  --    ---@module "auto-session"
  --    ---@type AutoSession.Config
  --    opts = {
  --      suppressed_dirs = { '~/', '~/workspace', '~/Downloads', '/' },
  --      -- log_level = 'debug',
  --    },
  --  },

  -- {
  --   'tpope/vim-dadbod',
  --   'kristijanhusak/vim-dadbod-completion',
  --   'kristijanhusak/vim-dadbod-ui',
  -- },

  { 'tpope/vim-dotenv' },
  -- {
  --   'knubie/vim-kitty-navigator',
  --   build = 'cp ./*.py ~/.config/kitty/',
  -- },
}
