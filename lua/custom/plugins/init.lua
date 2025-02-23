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
  --  {
  --    'Mofiqul/vscode.nvim',
  --    config = function()
  --      --     vim.o.background = 'light'
  --
  --      --   local c = require('vscode.colors').get_colors()
  --      require('vscode').setup {
  --        -- Alternatively set style in setup
  --        style = 'light',
  --        --
  --        --        -- Enable transparent background
  --        --        transparent = true,
  --        --
  --        --        -- Enable italic comment
  --        --        italic_comments = true,
  --        --
  --        --        -- Underline `@markup.link.*` variants
  --        --        underline_links = true,
  --        --
  --        --        -- Disable nvim-tree background color
  --        --        disable_nvimtree_bg = true,
  --        --
  --        --        -- Override colors (see ./lua/vscode/colors.lua)
  --        --        color_overrides = {
  --        --          vscLineNumber = '#FFFFFF',
  --        --        },
  --        --
  --        --        -- Override highlight groups (see ./lua/vscode/theme.lua)
  --        --        group_overrides = {
  --        --          -- this supports the same val table as vim.api.nvim_set_hl
  --        --          -- use colors from this colorscheme by requiring vscode.colors!
  --        --          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
  --        --        },
  --      }
  --      -- require('vscode').load()
  --
  --      -- load the theme without affecting devicon colors.
  --      -- vim.cmd.colorscheme 'vscode'
  --    end,
  --  },
  {
    'nickkadutskyi/jb.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      --require('jb').setup { transparent = false }
      vim.cmd.colorscheme 'jb'
      vim.o.background = 'light'
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {

        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          width = 50,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        update_focused_file = {
          enable = true,
          update_root = false,
          ignore_list = {},
        },
      }
      local function open_nvim_tree()
        -- open the tree
        require('nvim-tree.api').tree.open()
      end
      vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
    end,
  },
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    'dawsers/telescope-file-history.nvim',
    config = function()
      require('file_history').setup {
        -- This is the location where it will create your file history repository
        backup_dir = '~/.file-history-git',
        -- command line to execute git
        git_cmd = 'git',
      }
      require('telescope').load_extension 'file_history'
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
}
