-- add close buffer hotkey
---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    if not opts.defaults then
      opts.defaults = {}
    end
    if not opts.defaults.mappings then
      opts.defaults.mappings = {}
    end
    if not opts.defaults.mappings.n then
      opts.defaults.mappings.n = {}
    end
    if not opts.defaults.mappings.i then
      opts.defaults.mappings.i = {}
    end

    opts.defaults.mappings.n["<C-x>"] = require('telescope.actions').delete_buffer
    opts.defaults.mappings.i["<C-x>"] = require('telescope.actions').delete_buffer
  end,
}
