-- https://github.com/Wansmer/treesj
---@type LazySpec
return {
  {
    'Wansmer/treesj',
    -- keys = { '<space>aj', '<space>as' },
    cmd = { "TSJJoin", "TSJSplit" },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  },
}
