return {
    "tools-life/taskwiki",
    dependencies = {
        "vimwiki/vimwiki",
        "tbabej/tasklib",
    },
    ft = { "vimwiki", "markdown" },
    init = function()
        vim.g.vimwiki_list = {
            {
                path = "~/vimwiki/",
                syntax = "markdown",
                ext = ".md",
            },
        }
        vim.g.vimwiki_global_ext = 0
    end,
}
