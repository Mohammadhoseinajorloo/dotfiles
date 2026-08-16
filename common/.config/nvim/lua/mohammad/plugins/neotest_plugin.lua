return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/nvim-nio",
  },
  opts = function()
    local neotest_python = require("neotest-python")

    return {
      adapters = {
        neotest_python({
          dap = { justMyCode = false },
          runner = "pytest",
          python = function()
            return os.getenv("VIRTUAL_ENV") and os.getenv("VIRTUAL_ENV") .. "/bin/python" or "python"
          end,
          args = { "-q" },
        }),
      },
      discovery = {
        enabled = true,
      },
    }
  end,
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run()
      end,
      desc = "Neotest: Run nearest test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Neotest: Run current file",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Neotest: Toggle Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "Neotest: Show Output",
    },
  },
}
