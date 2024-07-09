return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<leader>a"] = { name = "AI" },
          ["<leader>ag"] = { ":Gen<CR>", desc = "Gen" },
          ["<leader>aj"] = { ":TSJJoin<CR>", desc = "Join" },
          ["<leader>as"] = { ":TSJSplit<CR>", desc = "Split" },

          ["<leader>gg"] = { name = "Custom GIT commands" },
          ["<leader>gge"] = { ":Telescope gitmoji<CR>", desc = "Commit with Gitmoji" },
          ["<leader>ggl"] = { ":silent! Flog -all<CR>", desc = "Log (vim-flog)" },
          ["<leader>ggb"] = { ":DiffviewFileHistory<CR>",  desc = "Branch History" },
          ["<leader>ggf"] = { ":DiffviewFileHistory %<CR>",  desc = "File History" },
          ["<leader>ggd"] = { ":DiffviewOpen<CR>",  desc = "Open diff view" },

          ["]q"] = { ":cnext<CR>", desc = "Quickfix Next" },
          ["[q"] = { ":cprev<CR>", desc = "Quickfix Prev" },
          ["<CR>"] = { "o<ESC>", desc = "Add line" },
          ["<leader>bn"] = { ":noa w<CR>",  desc = "Write w/o format" },
          ["<leader>tc"] = { ":tabclose<CR>",  desc = "tab close" },
          ["<leader>to"] = { ":tabnew<CR>",  desc = "tab new (open)" },
          ["<leader>lz"] = { ":LspRestart<CR>",  desc = "Restart LSP" },
        },
        v = {
          ["<leader>ag"] = { ":Gen<CR>", desc = "Gen" },
          ["<leader>fi"] = { ":BrowserSearch<CR>", desc = "Find in Internet" },
          ["<leader>a"] = { name = "AI" },
          ["<leader>ss"] = { ":Silicon /tmp/screenshots/{time:%Y-%m-%d-%H%M%S}.png --to-clipboard=true<CR><CR>", desc = "Screenshot" },
        },
      },
    },
  },
  -- {
  --   "AstroNvim/astrolsp",
  --   ---@type AstroLSPOpts
  --   opts = {
  --     mappings = {
  --       n = {
  --         -- this mapping will only be set in buffers with an LSP attached
  --         K = {
  --           function()
  --             vim.lsp.buf.hover()
  --           end,
  --           desc = "Hover symbol details",
  --         },
  --         -- condition for only server with declaration capabilities
  --         gD = {
  --           function()
  --             vim.lsp.buf.declaration()
  --           end,
  --           desc = "Declaration of current symbol",
  --           cond = "textDocument/declaration",
  --         },
  --       },
  --     },
  --   },
  -- },
}
