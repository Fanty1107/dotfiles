-- ~/.config/nvim-new/lua/lsp.lua
vim.lsp.enable({
  "html",
  "cssls",
  "gopls",
  "lua_ls",
  "clangd",
  "basedpyright",
  "rust-analyzer",
  "zls",
  "ols",
  "cmake-language-server",
})
vim.diagnostic.config({ virtual_text = true })
