-- LaTeX: vimtex compiles with latexmk and shows the PDF in Skim.
-- texlab (LSP, see configs/lspconfig.lua) only does completion + diagnostics.
return {
  {
    "lervag/vimtex",
    lazy = false, -- vimtex docs say not to lazy-load it
    init = function()
      vim.g.tex_flavor = "latex"

      -- PDF viewer: Skim, with SyncTeX (jumps to where your cursor is)
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1 -- move Skim to the cursor after each compile
      vim.g.vimtex_view_skim_activate = 0 -- keep focus in the terminal

      -- Compiler: latexmk, aux files go to ./build
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "build",
        out_dir = "build",
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-file-line-error",
          "-shell-escape",
        },
      }

      vim.g.vimtex_quickfix_mode = 0 -- don't open the error list on every compile
      vim.g.vimtex_syntax_conceal_disable = 0 -- show \alpha as α, etc.
      vim.g.vimtex_mappings_disable = { n = { "K" } } -- keep K for LSP hover
    end,
    keys = {
      { "<leader>lc", "<cmd>VimtexCompile<cr>", ft = "tex", desc = "LaTeX compile (continuous toggle)" },
      { "<leader>ll", "<cmd>VimtexCompile<cr>", ft = "tex", desc = "LaTeX compile (continuous toggle)" },
      { "<leader>ls","<cmd>VimtexCompileSS<cr>", ft = "tex", desc = "LaTeX compile once" },
      { "<leader>lv", "<cmd>VimtexView<cr>", ft = "tex", desc = "LaTeX view PDF (jump to cursor)" },
      { "<leader>le", "<cmd>VimtexErrors<cr>", ft = "tex", desc = "LaTeX show errors" },
      { "<leader>lt", "<cmd>VimtexTocToggle<cr>", ft = "tex", desc = "LaTeX table of contents" },
      { "<leader>lk", "<cmd>VimtexClean<cr>", ft = "tex", desc = "LaTeX clean aux files" },
      { "<leader>li", "<cmd>VimtexInfo<cr>", ft = "tex", desc = "LaTeX info" },
    },
  },
}
