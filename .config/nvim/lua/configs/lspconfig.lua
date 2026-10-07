require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- frontend
  "html",
  "cssls",
  "vtsls", -- TypeScript / JavaScript / React
  "eslint",
  "tailwindcss",
  "emmet_language_server",

  -- backend
  "clangd", -- C / C++
  "gopls", -- Go
  "basedpyright", -- Python (types, go-to-def, etc.)
  "ruff", -- Python (lint diagnostics + quick fixes)

  -- LaTeX
  "texlab", -- completion + diagnostics (vimtex does the building)
}

-- read :h vim.lsp.config for changing options of lsp servers
-- anything set here is merged on top of nvim-lspconfig's defaults

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
    },
  },
})

vim.lsp.config("basedpyright", {
  -- use the project's .venv if there is one
  before_init = function(_, config)
    local venv_python = (config.root_dir or vim.fn.getcwd()) .. "/.venv/bin/python"
    if vim.uv.fs_stat(venv_python) then
      config.settings.python = vim.tbl_extend("force", config.settings.python or {}, { pythonPath = venv_python })
    end
  end,
  settings = {
    basedpyright = {
      analysis = { typeCheckingMode = "standard" },
    },
  },
})

-- let basedpyright handle hover, ruff only does linting
vim.lsp.config("ruff", {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
})

-- vimtex already compiles, so texlab must not build too
vim.lsp.config("texlab", {
  settings = {
    texlab = {
      auxDirectory = "build",
      build = { onSave = false },
      chktex = { onEdit = false, onOpenAndSave = false }, -- chktex isn't installed
    },
  },
})

vim.lsp.enable(servers)
