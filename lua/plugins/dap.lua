return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      -- dap.adapters.codelldb = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     -- CHANGE THIS to your path!
      --     command = "/usr/bin/codelldb",
      --     args = { "--port", "${port}" },
      --
      --     -- On windows you may have to uncomment this:
      --     -- detached = false,
      --   },
      -- }
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
        name = "lldb",
      }
    end,
  },
}
