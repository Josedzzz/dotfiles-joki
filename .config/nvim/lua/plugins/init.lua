return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- load before saving so format on save works
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- NvChad defaults
        "lua", "luadoc", "printf", "vim", "vimdoc",
        -- frontend
        "html", "css", "scss", "javascript", "typescript", "tsx", "jsdoc",
        "json", "yaml", "markdown", "markdown_inline",
        -- backend
        "c", "cpp", "go", "gomod", "gosum", "gowork", "python",
        -- latex: vimtex does the highlighting, only bibtex needs a parser
        "bibtex",
      },
    },
  },
}
