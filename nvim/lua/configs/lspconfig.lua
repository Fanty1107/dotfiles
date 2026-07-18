local nvlsp = require("nvchad.configs.lspconfig")

local servers = { 
  "html", 
  "cssls", 
  "pyright", 
  "rust_analyzer",
  "gopls",
  "omnisharp",
  "ts_ls",
  "jdtls"
}

-- 1. Servidores Padrão usando a nova API
for _, lsp in ipairs(servers) do
  -- Garante que a tabela de configuração do servidor exista
  vim.lsp.config[lsp] = vim.lsp.config[lsp] or {}
  
  -- Injeta os atalhos e o autocompletar do NvChad
  vim.lsp.config[lsp].capabilities = nvlsp.capabilities
  vim.lsp.config[lsp].on_attach = nvlsp.on_attach
  
  -- Habilita o servidor
  vim.lsp.enable(lsp)
end

-- 2. Configuração customizada do Clangd usando a nova API
vim.lsp.config.clangd = vim.lsp.config.clangd or {}
vim.lsp.config.clangd.capabilities = nvlsp.capabilities
vim.lsp.config.clangd.on_attach = nvlsp.on_attach
vim.lsp.config.clangd.cmd = {
  'clangd',
  '--clang-tidy',
  '--background-index',
  '--offset-encoding=utf-8',
}
vim.lsp.config.clangd.root_markers = { '.clangd', 'compile_commands.json', '.git' }
vim.lsp.config.clangd.filetypes = { 'c', 'cpp', 'cc' }

vim.lsp.enable('clangd')
