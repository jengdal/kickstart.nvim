return {
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
        width = 60,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
        exclude = {
          '.env',
          '.direnv',
          '.prettierrc',
          '.gitignore',
          'proxy.conf.*',
          '.editorconfig',
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      git = {
        enable = true,
        --ignore = false,
        timeout = 500,
      },
    }

    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
    -- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    --   pattern = 'NvimTree*',
    --   callback = function()
    --     local api = require 'nvim-tree.api'
    --     local view = require 'nvim-tree.view'
    --
    --     if not view.is_visible() then
    --       api.tree.open()
    --     end
    --   end,
    -- })
    local function open_nvim_tree()
      require('nvim-tree.api').tree.toggle(false, true)
    end

    local path = vim.fn.getcwd()

    if string.find(path, '/john/workspace/') then
      vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
    end
    vim.keymap.set('n', '<leader>t', open_nvim_tree, { desc = 'Open File Tree' })
  end,
}
