return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- DESACTIVAR autocompletado
      vim.g.copilot_enabled = false
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      debug = false,
      show_help = false,
    },
  },
}
