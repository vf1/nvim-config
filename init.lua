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
    },
    {
      "matze/vim-move",
      lazy = false,
    },
    {
      cmd = { 
        "DiffviewOpen",
        "DiffviewFileHistory",
      },
      "sindrets/diffview.nvim",
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = { "TodoTelescope", "TodoQuickFix" },
      event = "VimEnter",
      opts = { },
    },
    { 
      "David-Kunz/gen.nvim",
      cmd = { "Gen" },
      opts = {
        model = "codellama:34b-instruct-q5_K_M",
        init = function(options) end, -- do NOT ollama auto start
        show_model = true,
      }
    },
    {
      "kevinhwang91/nvim-bqf",
      ft = "qf",
    },
    {
      -- https://github.com/Wansmer/treesj
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
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = function(_, opts)
        opts.window.width = 38 
        return opts
      end,
    },
  }, 

  mappings = {
    n = {
      ["<leader>ag"] = { ":Gen<CR>", desc = "Gen" },
      ["<leader>aj"] = { ":TSJJoin<CR>", desc = "Join" },
      ["<leader>as"] = { ":TSJSplit<CR>", desc = "Split" },
      ["<leader>a"] = { name = "AI" },
    },
    v = {
      ["<leader>ag"] = { ":Gen<CR>", desc = "Gen" },
      ["<leader>a"] = { name = "AI" },
    },
  },

  polish = function()
    local map = vim.api.nvim_set_keymap
    -- Set key bindings
    map("n", "<leader>bn", ":noa w<CR>", { noremap = true, silent = true,  desc = "Write w/o format" })
    map("n", "<leader>ggl", ":silent! Flog<CR>", { noremap = true, silent = true,  desc = "Simple git log (vim-flog)" })
    map("n", "<leader>ggb", ":DiffviewFileHistory<CR>", { noremap = true, silent = true,  desc = "Branch History" })
    map("n", "<leader>ggf", ":DiffviewFileHistory %<CR>", { noremap = true, silent = true,  desc = "File History" })
    map("n", "<leader>ggd", ":DiffviewOpen<CR>", { noremap = true, silent = true,  desc = "Open diff view" })
    map("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true,  desc = "tab close" })
    map("n", "<leader>to", ":tabnew<CR>", { noremap = true, silent = true,  desc = "tab new (open)" })
    map("n", "<leader>lz", ":LspRestart<CR>", { noremap = true, silent = true,  desc = "Restart LSP" })
    map("n", "<CR>", "o<ESC>", { noremap = true, silent = true,  desc = "Add line" })
    -- map("n", "<C-CR>", "O<ESC>", { noremap = true, silent = true,  desc = "Add line above" }) -- not work in terminal
    if vim.g.neovide == true then
      vim.g.neovide_cursor_animation_length = 0.05
      vim.g.neovide_cursor_trail_size = 0.2
      vim.o.guifont = "Droid Sans Mono:h11"
      vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
    end
    -- colors
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#564656", bg = "#443244" })
  end,

   -- Set colorscheme to use
  colorscheme = "catppuccin-mocha",
}


