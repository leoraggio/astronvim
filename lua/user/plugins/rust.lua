return {
  {
    "simrat39/rust-tools.nvim", -- add lsp plugin
    after = { "mason-lspconfig" },
    config = function()
      require("rust-tools").setup({
        server = astronvim.lsp.server_settings("rust_analyzer"),
        tools = {
          reload_workspace_from_cargo_toml = true,
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            parameter_hints_prefix = "  ",
            other_hints_prefix = "  ",
          },
          hover_actions = {
            border = "rounded",
          },
        },
      })
    end,
  },
  {
    "Saecki/crates.nvim",
    after = "nvim-cmp",
    config = function()
      require("crates").setup()
      astronvim.add_cmp_source({ name = "crates", priority = 1100 })

      -- Crates mappings:
      local map = vim.api.nvim_set_keymap
      map(
        "n",
        "<leader>Ct",
        ":lua require('crates').toggle()<cr>",
        { desc = "Toggle extra crates.io information" }
      )
      map(
        "n",
        "<leader>Cr",
        ":lua require('crates').reload()<cr>",
        { desc = "Reload information from crates.io" }
      )
      map("n", "<leader>CU", ":lua require('crates').upgrade_crate()<cr>", { desc = "Upgrade a crate" })
      map(
        "v",
        "<leader>CU",
        ":lua require('crates').upgrade_crates()<cr>",
        { desc = "Upgrade selected crates" }
      )
      map(
        "n",
        "<leader>CA",
        ":lua require('crates').upgrade_all_crates()<cr>",
        { desc = "Upgrade all crates" }
      )
    end,
  },
}
