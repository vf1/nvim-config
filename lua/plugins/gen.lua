-- https://github.com/David-Kunz/gen.nvim
---@type LazySpec
return {
  { 
    "David-Kunz/gen.nvim",
    cmd = { "Gen" },
    opts = {
      -- model = "codellama:70b-instruct-q5_K_M",
      -- model = "llama3:70b-instruct-q5_K_M",
      model = "llama3.1:8b-instruct-q8_0",
      init = function(options) end, -- do NOT ollama auto start
      show_model = true,
    }
  },
}
