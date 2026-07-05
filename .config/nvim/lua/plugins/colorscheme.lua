-- return {
--   -- Catppuccin
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     opts = {
--       flavour = "mocha", -- latte, frappe, macchiato, mocha
--       transparent = false,
--       -- Disable cursorline highlighting
--       integrations = {
--         native_lsp = {
--           underlines = {
--             errors = { "undercurl" },
--             hints = { "undercurl" },
--             warnings = { "undercurl" },
--             information = { "undercurl" },
--           },
--         },
--       },
--       highlight_overrides = {
--         all = function(colors)
--           return {
--             CursorLine = { bg = "NONE" }, -- This disables cursor line background
--             CursorLineNr = { fg = colors.blue }, -- Keep line number visible
--           }
--         end,
--       },
--     },
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

-- return {
--   -- Iceberg theme - load it first
--   {
--     "cocopon/iceberg.vim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       -- First, apply the Iceberg theme normally
--       vim.cmd.colorscheme("iceberg")
--
--       -- THEN, after theme is loaded, ONLY modify the cursor line settings
--       -- but preserve ALL other colors
--       vim.defer_fn(function()
--         -- Set cursor line to only highlight the number, not the whole line
--         vim.opt.cursorline = true
--         vim.opt.cursorlineopt = "number"
--
--         -- Make CursorLine transparent (no background)
--         -- But preserve the original text colors
--         local cursorline_bg = vim.api.nvim_get_hl(0, { name = "CursorLine" })
--         vim.api.nvim_set_hl(0, "CursorLine", {
--           bg = "NONE",
--           fg = cursorline_bg.fg,
--           sp = cursorline_bg.sp,
--           underline = cursorline_bg.underline,
--           undercurl = cursorline_bg.undercurl,
--           strikethrough = cursorline_bg.strikethrough,
--           italic = cursorline_bg.italic,
--           bold = cursorline_bg.bold,
--         })
--
--         -- Make line number visible but with transparent background
--         -- Use Iceberg's colors for line numbers
--         vim.api.nvim_set_hl(0, "CursorLineNr", {
--           bg = "NONE",
--           fg = "#84a0c6", -- Iceberg blue
--           bold = true,
--         })
--
--         -- Make statusline and tabline transparent if you use them
--         vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })
--
--         -- Ensure regular line numbers keep their Iceberg colors
--         vim.api.nvim_set_hl(0, "LineNr", {
--           bg = "NONE",
--           fg = "#6b7089", -- Iceberg gray-blue
--         })
--
--         -- Make floating windows transparent (like LSP hover, which-key, etc.)
--         vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })
--
--         -- Make popup menu transparent
--         vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2d4f67" }) -- Keep a subtle background for selection
--         vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#4b5b6b" })
--       end, 50)
--     end,
--   },
--
--   -- Tell LazyVim to use Iceberg
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "iceberg",
--     },
--   },
-- }

-- return {
--   {
--     "olivercederborg/poimandres.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("poimandres").setup({
--         bold_vert_split = false,
--         dim_nc_background = false,
--         disable_background = false, --
--         disable_float_background = false, -- floats normales
--         disable_italics = false,
--       })
--
--       vim.cmd.colorscheme("poimandres")
--
--       -- como siempre en tu setup
--       vim.opt.cursorline = false
--     end,
--   },
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       variant = "main",
--       disable_background = true, -- Enables transparency
--       disable_float_background = true, -- Transparent floating windows
--     })
--     vim.cmd("colorscheme rose-pine")
--     -- Make the cursor line transparent
--     vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
--   end,
-- }

-- return {
--   -- Night Fox theme with Dusk Fox variant
--   {
--     "EdenEast/nightfox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       -- Load the nightfox plugin
--       require("nightfox").setup({
--         -- Use the duskfox variant
--         options = {
--           -- Compiled file's location
--           compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--           compile_file_suffix = "_compiled", -- Compiled file suffix
--           transparent = false, -- Disable transparency (opaque background)
--           terminal_colors = true, -- Set terminal colors
--           dim_inactive = false, -- Don't dim inactive windows
--           styles = { -- Style for various syntax groups
--             comments = "italic",
--             keywords = "bold",
--             types = "italic,bold",
--           },
--           inverse = { -- Inverse highlight for different groups
--             match_paren = false,
--             visual = false,
--             search = false,
--           },
--           modules = { -- Enable/disable various modules
--             -- ... (keep defaults)
--           },
--         },
--       })
--
--       -- Apply the duskfox colorscheme
--       vim.cmd.colorscheme("duskfox")
--
--       -- Remove cursor line highlighting completely
--       vim.defer_fn(function()
--         -- Turn off cursor line
--         vim.opt.cursorline = false
--
--         -- If you still want to see which line you're on via line number,
--         -- uncomment these lines:
--         -- vim.opt.cursorline = true
--         -- vim.opt.cursorlineopt = "number"
--         -- vim.api.nvim_set_hl(0, "CursorLineNr", {
--         --   bg = "NONE",
--         --   fg = "#ae81ff", -- Dusk Fox purple
--         --   bold = true
--         -- })
--
--         -- Ensure no cursor line background lingers
--         vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "NONE" })
--         vim.api.nvim_set_hl(0, "CursorLineFold", { bg = "NONE" })
--       end, 50)
--     end,
--   },
--
--   -- Tell LazyVim to use Dusk Fox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "duskfox",
--     },
--   },
-- }

-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     opts = {
--       flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
--       transparent_background = true, -- Enables transparency
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--       },
--     },
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

-- return {
--   {
--     "rebelot/kanagawa.nvim",
--     priority = 1000,
--     config = function()
--       vim.cmd("colorscheme kanagawa-dragon")
--       vim.opt.cursorline = false
--
--       -- Set transparent background
--       local hl_groups = { "Normal", "NormalFloat", "SignColumn", "StatusLine", "StatusLineNC", "WinSeparator" }
--       for _, group in ipairs(hl_groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--
--       -- Sidebar transparency (for NvimTree, Telescope, NeoTree, etc.)
--       local sidebar_groups = { "NormalNC", "TelescopeNormal", "NvimTreeNormal", "NeoTreeNormal" }
--       for _, group in ipairs(sidebar_groups) do
--         vim.api.nvim_set_hl(0, group, { bg = "none" })
--       end
--
--       -- Fix LSP popups (make them transparent or black)
--       vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" }) -- Autocomplete menu
--       vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1a1a1a" }) -- Selected item (dark gray)
--       vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" }) -- Borders of floating windows
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Floating windows (LSP, etc.)
--       vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none" }) -- LSP Hints
--       vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none" }) -- LSP Errors
--       vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none" }) -- LSP Warnings
--       vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none" }) -- LSP Info
--
--       -- Make line numbers transparent
--       vim.api.nvim_set_hl(0, "LineNr", { bg = "none" }) -- Normal line numbers
--       vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#ff9e64" }) -- Highlight current line number (optional: set a color)
--     end,
--   },
-- }

return {
  {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = true

      require("nord").set()

      -- Extra transparency fixes (LazyVim-safe)
      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "MsgArea",
        "TelescopeNormal",
        "TelescopeBorder",
        "Pmenu",
      }

      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end

      vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    end,
  },
}
