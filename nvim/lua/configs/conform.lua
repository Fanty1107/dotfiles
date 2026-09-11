local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    rust = { "rustfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },

    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },

    python = { "ruff" },
  },

  format_on_save = {
  -- These options will be passed to conform.format()
     timeout_ms = 1000,
   lsp_fallback = true,
   },
}

return options
