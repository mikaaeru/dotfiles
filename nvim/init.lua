-- 1. Enable Syntax & Colors
vim.cmd("syntax on")             -- Enables syntax highlighting
vim.opt.termguicolors = true     -- Enables 24-bit RGB color in the TUI

-- 2. Basic UI Settings
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true    -- Optional: easier jumping between lines
vim.opt.cursorline = true        -- Highlight the current line

-- 3. Transparency Magic
-- This function clears the background of various UI elements
local function set_transparency()
    local groups = { 
        "Normal", "NonText", "SignColumn", "NormalNC", 
        "EndOfBuffer", "MsgArea", "NormalFloat" 
    }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
end

-- Apply transparency now
set_transparency()

-- Optional: Re-apply transparency if you change colorschemes later
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_transparency,
})
