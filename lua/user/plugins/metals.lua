return {
  "scalameta/nvim-metals",
  ft = { "scala" },
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },
  config = function()
    local metals_config = require("metals").bare_config()


    metals_config.init_options.statusBarProvider = false
    metals_config.on_attach = function(client, bufnr)
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("metals").setup_dap()
    end

    -- Example of settings
    metals_config.settings = {
      showImplicitArguments = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      -- serverProperties = { "-Xmx10GB" }
    }

    vim.o.shortmess = string.gsub(vim.o.shortmess, 'F', '') .. 'c'

    -- LSP mappings
    local function map(mode, lhs, rhs, opts)
      local options = { noremap = true }
      if opts then
        options = vim.tbl_extend("force", options, opts)
      end
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end

    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { nowait = true })
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')


    -- Autocmd that will actually be in charging of starting the whole thing
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
