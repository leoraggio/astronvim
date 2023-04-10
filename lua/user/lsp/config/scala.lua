return {
  servers = {
    "metals"
  },
  setup_handlers = {
    -- add custom handler
    metals = function(_, opts)
      require("metals").setup({ server = opts })
    end,
  },
}
