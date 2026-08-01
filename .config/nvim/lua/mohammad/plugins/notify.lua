return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },

    config = function()
        -- setup notify with neutral theme
        local notify = require("notify")
        notify.setup({
            background_colour = "#000000", -- or "Normal"
            render = "default",
            stages = "fade_in_slide_out",
            timeout = 3000,
        })
        vim.notify = notify

        -- highlight groups for neutral notification theme
        vim.cmd([[
            highlight NotifyERRORBorder guifg=#777777
            highlight NotifyWARNBorder guifg=#888888
            highlight NotifyINFOBorder guifg=#999999
            highlight NotifyDEBUGBorder guifg=#666666
            highlight NotifyTRACEBorder guifg=#555555

            highlight NotifyERRORIcon guifg=#777777
            highlight NotifyWARNIcon guifg=#888888
            highlight NotifyINFOIcon guifg=#999999
            highlight NotifyDEBUGIcon guifg=#666666
            highlight NotifyTRACEIcon guifg=#555555

            highlight NotifyERRORTitle guifg=#777777
            highlight NotifyWARNTitle guifg=#888888
            highlight NotifyINFOTitle guifg=#999999
            highlight NotifyDEBUGTitle guifg=#666666
            highlight NotifyTRACETitle guifg=#555555

            highlight NotifyERRORBody guifg=#DDDDDD guibg=NONE
            highlight NotifyWARNBody guifg=#CCCCCC guibg=NONE
            highlight NotifyINFOBody guifg=#BBBBBB guibg=NONE
            highlight NotifyDEBUGBody guifg=#AAAAAA guibg=NONE
            highlight NotifyTRACEBody guifg=#999999 guibg=NONE
        ]])

        -- setup noice
        require("noice").setup({
            lsp = {
                progress = { enabled = true },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            messages = {
                enabled = true,
            },
            notify = {
                enabled = true,
            },
            views = {
                mini = {
                    timeout = 2000,
                },
                notify = {
                    win_options = {
                        winblend = 20,
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                    },
                },
            },
        })
    end,
}
