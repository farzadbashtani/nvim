return {
    {
        "saghen/blink.cmp",
        opts = function(_, opts)
            opts.keymap = {
                preset = "super-tab",
                ["C-y"] = { "select_and_accept" },
            }
        end,
    },
}
