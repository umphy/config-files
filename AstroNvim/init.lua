--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
    treesitter = {
        defaults = {
            treesitter = {
                -- preview = false
            },
        },
    },

    ["server-settings"] = {
        tsserver = {
            root_dir = 'web'
        },
    },

    plugins = {
        heirline = function(config)
            -- the first element of the default configuration table is the statusline
            config[1] = {
                -- set the fg/bg of the statusline
                hl = { fg = "fg", bg = "bg" },
                -- when adding the mode component, enable the mode text with padding to the left/right of it
                astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
                -- add all the other components for the statusline
                astronvim.status.component.git_branch(),
                astronvim.status.component.file_info(),
                astronvim.status.component.git_diff(),
                astronvim.status.component.diagnostics(),
                astronvim.status.component.fill(),
                astronvim.status.component.macro_recording(),
                astronvim.status.component.fill(),
                astronvim.status.component.lsp(),
                astronvim.status.component.treesitter(),
                astronvim.status.component.nav(),
            }
            -- return the final configuration table
            return config
        end,
    },
}

return config
