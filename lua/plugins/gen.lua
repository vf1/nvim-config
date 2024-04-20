-- https://github.com/David-Kunz/gen.nvim
---@type LazySpec
return {
  { 
    "David-Kunz/gen.nvim",
    cmd = { "Gen" },
    opts = {
      -- model = "codellama:70b-instruct-q5_K_M",
      model = "codellama:70b-code-q5_K_M",
      init = function(options) end, -- do NOT ollama auto start
      show_model = true,
    }
  },
}
