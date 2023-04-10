-- use mason-lspconfig to configure LSP installations
return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "clangd",
      "cssls",
      "html",
      "marksman",
      "jsonls",
      "pyright",
      "sqlls",
      "rust_analyzer",
      "lua_ls",
      "tsserver",
      "yamlls",
    },
  },
}
