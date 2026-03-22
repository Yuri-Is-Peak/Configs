return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()

        -- open/close ui automatically
        dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
    end
}
