local debugging_signs = require("util.icons").debugging_signs

return {
	"mfussenegger/nvim-dap",
    keys = function(_, keys)
       local dap = require 'dap'
       local dapui = require 'dapui'
       return {
          -- Basic debugging keymaps, feel free to change to your liking!
          { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
          { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
          { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
          { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
          { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
          {
            '<leader>B',
            function()
              dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Debug: Set Breakpoint',
          },
          -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
          { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
          unpack(keys),
       }
    end,
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- set custom icons
		for name, sign in pairs(debugging_signs) do
			sign = type(sign) == "table" and sign or { sign }
			vim.fn.sign_define(
				"Dap" .. name,
				{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
			)
		end

		-- setup dap
		dapui.setup()

		-- add event listeners
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
			vim.cmd("Hardtime disable")
			vim.cmd("NvimTreeClose")
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
			vim.cmd("Hardtime enable")
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
			vim.cmd("Hardtime enable")
		end
	end,
	dependencies = {
        
        -- create a beautiful debugger UI
        "rcarriga/nvim-dap-ui",

        -- Required for nvim-dap-ui
        "nvim-neotest/nvim-nio",

        -- Install the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'mfussenegger/nvim-dap-python',
        'leoluz/nvim-dap-go',
    },
}
