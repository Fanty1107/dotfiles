require("nvchad.configs.lspconfig").defaults()
vim.lsp.config.clangd = {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}

local servers = {
  "html", "cssls", "rust_analyzer",
  "clangd", "ts_ls", "basedpyright",
}
vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
