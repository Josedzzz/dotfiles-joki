require "nvchad.autocmds"

-- soft-wrap long lines in prose files (thesis paragraphs), like in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("prose_wrap", { clear = true }),
  pattern = { "tex", "plaintex", "bib", "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true -- break at words, not mid-word
    vim.opt_local.spell = false
  end,
})
