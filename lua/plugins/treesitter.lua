-- tune selection
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<TAB>', -- conflicting with vim-visual-multi
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
      }
    }
  end,
}
