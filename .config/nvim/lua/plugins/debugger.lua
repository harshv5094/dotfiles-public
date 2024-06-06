return {
	-- nvim-dap -> Debug Adapter Protocol for neovim.
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		event = "VeryLazy",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dap-go").setup()
			require("dapui").setup()

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

			-- Toggle Debugger breakpoints.
			vim.keymap.set("n", "<leader>dt", function()
				dap.toggle_breakpoint()
			end, { desc = "Debugger -> toggle_breakpoint" })

			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end, { desc = "Debugger -> toggle_breakpoint" })

			-- Debugger UI preview
			vim.keymap.set({ "n", "v" }, "<leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "Debugger -> preview" })

			-- Debugger Frames
			vim.keymap.set("n", "<leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "Debugger -> frames" })

			-- Debugger Center Float
			vim.keymap.set("n", "<leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "Debugger -> scopes" })
		end,
	},
}
