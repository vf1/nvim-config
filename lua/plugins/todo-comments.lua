-- https://github.com/folke/todo-comments.nvim
---@type LazySpec
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTelescope", "TodoQuickFix" },
    event = "VimEnter",
    opts = { },
  },
}
