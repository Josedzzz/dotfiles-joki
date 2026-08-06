-- LaTeX / BibTeX workflow for LazyVim (macOS)
return {
  -- Core LaTeX plugin: vimtex (compile, view PDF, sync with Skim)
  {
    "lervag/vimtex",
    lazy = false, -- Load immediately for .tex files
    init = function()
      vim.g.tex_flavor = "latex"
      -- PDF viewer: Skim (recommended on macOS)
      vim.g.vimtex_view_method = "skim"
      -- Compiler: latexmk
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build", -- Auxiliary files in 'build' directory
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-file-line-error",
          "-shell-escape",
        },
      }
      -- Additional options
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_automatic = 1 -- Open PDF automatically on compile
      vim.g.vimtex_indent_enabled = 1
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_syntax_conceal_disable = 0 -- Enable conceal (e.g. \alpha -> α)
    end,
    keys = {
      { "<leader>lc", "<cmd>VimtexCompile<cr>", desc = "LaTeX: Compile" },
      { "<leader>ll", "<cmd>VimtexCompileToggle<cr>", desc = "LaTeX: Toggle continuous compile" },
      { "<leader>lv", "<cmd>VimtexView<cr>", desc = "LaTeX: View PDF" },
      { "<leader>lk", "<cmd>VimtexClean<cr>", desc = "LaTeX: Clean auxiliary files" },
    },
  },
  -- texlab-specific config (LSP): diagnostics and completion only.
  -- Building/viewing is handled by vimtex to avoid double compilation.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              auxDirectory = "build",
              chktex = { onEdit = false, onOpenAndSave = false }, -- chktex not installed
              build = {},
            },
          },
        },
      },
    },
  },
}