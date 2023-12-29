return {
  
  plugins = {
    "catppuccin/nvim",
    {
      -- https://github.com/rbong/vim-flog
      "rbong/vim-flog",
      lazy = true,
      cmd = { "Flog", "Flogsplit", "Floggit" },
      dependencies = {
        "tpope/vim-fugitive",
      },
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
      end
    },
    {
      "ggandor/leap.nvim",
      keys = {
        { "s", "<Plug>(leap-forward-to)", mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
        { "x", "<Plug>(leap-forward-till)", mode = { "x", "o" }, desc = "Leap forward till" },
        { "X", "<Plug>(leap-backward-till)", mode = { "x", "o" }, desc = "Leap backward till" },
        { "gs", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from window" },
      },
      opts = {},
      init = function() -- https://github.com/ggandor/leap.nvim/issues/70#issuecomment-1521177534
        vim.api.nvim_create_autocmd("User", {
          callback = function()
            vim.cmd.hi("Cursor", "blend=100")
            vim.opt.guicursor:append { "a:Cursor/lCursor" }
          end,
          pattern = "LeapEnter",
        })
        vim.api.nvim_create_autocmd("User", {
          callback = function()
            vim.cmd.hi("Cursor", "blend=0")
            vim.opt.guicursor:remove { "a:Cursor/lCursor" }
          end,
          pattern = "LeapLeave",
        })
      end,
      dependencies = {
        "tpope/vim-repeat",
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<TAB>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
          }
        }
      end,
    }
  }, 

  polish = function()
    local map = vim.api.nvim_set_keymap
    -- Set key bindings
    map("n", "<leader>bn", ":noa w<CR>", { noremap = true, silent = true,  desc = "Write w/o format" })
    map("n", "<leader>gg", ":silent! Flog<CR>", { noremap = true, silent = true,  desc = "A-la Git Graph (vim-flog)" })
    map("n", "<leader>lz", ":LspRestart<CR>", { noremap = true, silent = true,  desc = "Restart LSP" })
    map("n", "<CR>", "o<ESC>", { noremap = true, silent = true,  desc = "Add line" })
    -- map("n", "<C-CR>", "O<ESC>", { noremap = true, silent = true,  desc = "Add line above" })
    -- not work in terminal
    if vim.g.neovide == true then
      vim.g.neovide_cursor_animation_length = 0.05
      vim.g.neovide_cursor_trail_size = 0.2
      vim.o.guifont = "Droid Sans Mono:h11"
      vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
    end
  end,

   -- Set colorscheme to use
  colorscheme = "catppuccin-mocha",
}

