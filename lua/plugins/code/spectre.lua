return {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>rr",
            function()
                require("spectre").open()
            end,
            desc = "[R]eplace in [R]eplace files",
        },
        {
            "<leader>rw",
            function()
                require("spectre").open_visual({ select_word = true })
            end,
            desc = "[R]eplace current [W]ord",
        },
        {
            "<leader>rf",
            function()
                require("spectre").open_file_search()
            end,
            desc = "[R]eplace in current [F]ile",
        },
    },
    opts = {
        find_engine = {
            ["rg"] = {
                cmd = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--glob=!.git",
                    "--glob=!node_modules",
                    "--glob=!build",
                    "--glob=!target",
                    "--glob=!dist",
                    "--glob=!bin",
                    "--glob=!vendor",
                    "--glob=!__pycache__",
                },
            },
        },
    },
}
