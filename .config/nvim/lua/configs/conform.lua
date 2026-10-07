local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    -- frontend
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },

    -- backend
    c = { "clang-format" },
    cpp = { "clang-format" },
    go = { "goimports", "gofumpt" },
    python = { "ruff_organize_imports", "ruff_format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
}

return options
