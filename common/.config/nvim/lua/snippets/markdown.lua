local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function next_index()
    local today = os.date("%Y%m%d")
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local max = 0

    for _, line in ipairs(lines) do
        for idx in line:gmatch("#(%d+)" .. today) do
            idx = tonumber(idx)
            if idx > max then
                max = idx
            end
        end
    end

    return tostring(max + 1)
end

return {
    -----------------------------------------------------------
    -------------------- Task Snipped ----------------------
    -----------------------------------------------------------
    s("todo", {
        t("- [ ] "),
        i(1, "description"),
        t(" ("),
        i(2, "scope"),
        t(") #"),
        f(function()
            local today = os.date("%Y%m%d")
            return next_index() .. today
        end, {}),
    }),
}
