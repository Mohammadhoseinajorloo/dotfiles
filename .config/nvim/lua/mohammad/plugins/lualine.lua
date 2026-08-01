return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local my_lualine_theme = {
            normal = {
                a = { fg = "#000000", bg = "#DDDDDD", gui = "bold" },
                b = { fg = "#CCCCCC", bg = "#333333" },
                c = { fg = "#AAAAAA", bg = "NONE" },
            },
            insert = {
                a = { fg = "#000000", bg = "#BBBBBB", gui = "bold" },
            },
            visual = {
                a = { fg = "#000000", bg = "#999999", gui = "bold" },
            },
            replace = {
                a = { fg = "#000000", bg = "#AAAAAA", gui = "bold" },
            },
            inactive = {
                a = { fg = "#666666", bg = "NONE", gui = "bold" },
                b = { fg = "#777777", bg = "NONE" },
                c = { fg = "#888888", bg = "NONE" },
            },
        }

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                theme = my_lualine_theme,
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })
    end,
}
