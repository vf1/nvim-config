-- https://github.com/goolord/alpha-nvim
---@type LazySpec
return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    table.insert(
      opts.section.buttons.val,
      1,
      opts.button("LDR S F", " Load a dirsession")
    )
    return opts
  end,
}
