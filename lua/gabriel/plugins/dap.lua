return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui", -- UI for debugging
		"jay-babu/mason-nvim-dap.nvim", -- Mason support for DAP
		"nvim-neotest/nvim-nio", -- Required dependency for nvim-dap-ui
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Setup DAP UI
		dapui.setup()

		-- Auto open/close DAP UI on debug start/stop
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- C++ LLDB Debug Adapter
		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- Path to LLDB on macOS
			name = "lldb",
		}

		-- C++ Debugging Configuration
		dap.configurations.cpp = {
			{
				name = "Launch C++ Program",
				type = "lldb",
				request = "launch",
				program = "${workspaceFolder}/bin", -- Adjust path
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			},
		}
	end,
}
