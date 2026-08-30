return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"diff",
				"html",
				"javascript",
				"json",
				"lua",
				"python",
				"tsx",
				"typescript",
				"vim",
				"yaml",
				"rust",
				"go",
				"sql",
				"java",
				"kotlin",
				"groovy",
				"embedded_template",
				"csharp",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		},
	},
}
