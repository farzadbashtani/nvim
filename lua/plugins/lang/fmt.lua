return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					if not vim.g.formatting_enabled then
						vim.notify("Formatting is disabled", vim.log.levels.WARN)
						return
					end
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[C]ode [F]ormat buffer",
				},
			{
				"<leader>tf",
				function()
					vim.g.formatting_enabled = not vim.g.formatting_enabled
					if vim.g.formatting_enabled then
						vim.notify("Auto-formatting enabled", vim.log.levels.INFO)
					else
						vim.notify("Auto-formatting disabled", vim.log.levels.INFO)
					end
				end,
				desc = "[T]oggle [F]ormatting",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				if not vim.g.formatting_enabled then
					return false
				end

				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
