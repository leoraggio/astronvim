return {
  "is0n/jaq-nvim",
  ft = { "rust", "python", "go", "scala", "markdown", "sh" },
  opts = {
    cmds = {
      external = {
        markdown = "glow %",
        python = "python3 %",
        go = "go run %",
        rust = "cargo run %",
        sh = "sh %",
      }
    },
    behavior = {
      default = "float",
      startinsert = false,
      autosave = false
    },
    ui = {
      float = {
        border = "none",
        winhl = "Normal",
        borderhl = "FloatBorder",
        winblend = 0,
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
      },
      terminal = {
        position = "bot",
        size = 10,
        -- Disable line numbers
        line_no = false
      },
      quickfix = {
        position = "bot",
        size = 10
      }
    },
  },
}
