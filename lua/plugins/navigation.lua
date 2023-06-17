return {
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings(true)
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
}
