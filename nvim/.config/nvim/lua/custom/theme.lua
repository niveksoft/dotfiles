-- Custom Theme Module (Ghostty Light Inspired)

local M = {} -- Module table

-- Define Colors (approximating Ghostty Builtin Light & tmux theme)
local colors = {
    bg      = '#f8f8f8', -- Light grey background
    fg      = '#282a36', -- Dark grey foreground
    grey    = '#686868', -- Medium grey (inactive text, borders)
    blue    = '#3465a4', -- Blue accent Darker: #3465a4 Lighter: #57c7ff
    yellow  = '#c4a000', -- Yellow accent Darker: #c4a000 Lighter: #f3f99d
    red     = '#ff5c57', -- Red accent Darker: #cc0000 Lighter: #ff5c57
    green   = '#4e9a06', -- Green accent Lighter: #5af78e
    magenta = '#ff6ac1', -- Magenta accent Darker: #75507b
    cyan    = '#06989a', -- Cyan accent Darker: #06989a Lighter: #9aedfe
    cursor_grey = '#dcdcdc', -- Slightly darker grey for cursorline bg (Increased contrast)
    diff_add_bg = '#e6ffed', -- Lighter green for diff add bg
    diff_change_bg = '#e6f3ff', -- Lighter blue for diff change bg
    diff_delete_bg = '#ffeeed', -- Lighter red for diff delete bg
    diff_text_bg = '#f2f2ff', -- Lighter purple for diff text bg
}

-- Helper function to set highlights (local to this module)
local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Theme application function (local to this module)
local function ApplyCustomTheme()
    -- Ensure termguicolors is enabled
    if vim.opt.termguicolors:get() == false then
    print("Warning: termguicolors not enabled. Theme may not display correctly.")
    end
    -- Ensure background is light
    if vim.opt.background:get() ~= 'light' then
     print("Warning: background is not 'light'. Theme may not display correctly.")
     vim.opt.background = 'light' -- Force it for this theme
    end

    -- Optional: Clear existing highlights before applying new ones
    vim.cmd('highlight clear')
    if vim.fn.exists("syntax_on") then
    vim.cmd('syntax reset')
    end

    -- Set the colorscheme name (for :colorscheme command)
    vim.g.colors_name = "customlight"

    -- Set Base Highlights
    set_hl('Normal',      { fg = colors.fg, bg = colors.bg })
    set_hl('NormalNC',    { fg = colors.fg, bg = colors.bg }) -- Non-current windows background
    set_hl('EndOfBuffer', { fg = colors.bg }) -- Hide ~ markers

    -- UI Elements
    set_hl('StatusLine',   { fg = colors.fg, bg = colors.bg })
    set_hl('StatusLineNC', { fg = colors.grey, bg = colors.bg }) -- Inactive status line
    set_hl('TabLine',      { fg = colors.grey, bg = colors.bg }) -- Inactive tabs
    set_hl('TabLineSel',   { fg = colors.fg, bg = colors.bg, bold = true }) -- Active tab (matches active window in tmux)
    set_hl('TabLineFill',  { bg = colors.bg }) -- Background of tab area
    set_hl('VertSplit',    { fg = colors.grey }) -- Separator between vertical splits
    set_hl('WinSeparator', { fg = colors.grey }) -- Window separators
    set_hl('LineNr',       { fg = colors.grey }) -- Line numbers
    -- set_hl('LineNr',       { fg = colors.fg, bg = colors.bg, bold = true})
    set_hl('CursorLineNr', { fg = colors.fg, bg = colors.bg, bold = true }) -- Line number on cursor line
    set_hl('CursorLine',   { bg = colors.cursor_grey }) -- Background of cursor line
    set_hl('ColorColumn',  { bg = colors.cursor_grey }) -- Background for ColorColumn if used
    set_hl('SignColumn',   { bg = colors.bg }) -- Sign column background
    set_hl('Folded',       { fg = colors.grey, bg = colors.cursor_grey })
    set_hl('FoldColumn',   { fg = colors.grey, bg = colors.bg })
    set_hl('Whitespace',   { fg = colors.grey }) -- Color for listchars

    -- Search / Selection
    set_hl('Search',       { fg = colors.fg, bg = colors.yellow })
    set_hl('IncSearch',    { fg = colors.fg, bg = colors.yellow, reverse = true})
    set_hl('Visual',       { bg = colors.grey, fg = colors.bg }) -- Reverse grey

    -- Messages / Prompts
    set_hl('Question',     { fg = colors.blue, bold = true })
    set_hl('ModeMsg',      { fg = colors.fg, bold = true })
    set_hl('MoreMsg',      { fg = colors.blue, bold = true })
    set_hl('ErrorMsg',     { fg = colors.bg, bg = colors.red })
    set_hl('WarningMsg',   { fg = colors.fg, bg = colors.yellow })

    -- Basic Syntax Highlighting (adjust based on preference)
    set_hl('Comment',      { fg = colors.grey })
    set_hl('String',       { fg = colors.red })
    set_hl('Character',    { fg = colors.red })
    set_hl('Number',       { fg = colors.magenta })
    set_hl('Boolean',      { fg = colors.magenta })
    set_hl('Float',        { fg = colors.magenta })
    set_hl('Constant',     { fg = colors.yellow }) -- Includes true/false usually
    set_hl('Identifier',   { fg = colors.fg }) -- Variables
    set_hl('Function',     { fg = colors.fg, bold = true })
    set_hl('Statement',    { fg = colors.blue, bold = true }) -- if, else, for, while, etc.
    set_hl('Conditional',  { fg = colors.blue, bold = true })
    set_hl('Repeat',       { fg = colors.blue, bold = true })
    set_hl('Label',        { fg = colors.blue, bold = true })
    set_hl('Operator',     { fg = colors.fg })
    set_hl('Keyword',      { fg = colors.blue, bold = true }) -- Other keywords
    set_hl('PreProc',      { fg = colors.cyan }) -- #include, #define, etc.
    set_hl('Include',      { fg = colors.cyan })
    set_hl('Define',       { fg = colors.cyan })
    set_hl('Macro',        { fg = colors.cyan })
    set_hl('Type',         { fg = colors.green }) -- int, char, struct, etc.
    set_hl('StorageClass', { fg = colors.green }) -- static, extern, etc.
    set_hl('Structure',    { fg = colors.green })
    set_hl('Typedef',      { fg = colors.green })
    set_hl('Special',      { fg = colors.magenta }) -- Special symbols, tags
    set_hl('SpecialKey',   { fg = colors.grey }) -- Unprintable characters in text
    set_hl('Underlined',   { underline = true })
    set_hl('Bold',         { bold = true })
    set_hl('Italic',       { italic = true })
    set_hl('Todo',         { fg = colors.fg, bg = colors.yellow, bold = true })
    set_hl('Error',        { fg = colors.bg, bg = colors.red })
    set_hl('Exception',    { fg = colors.blue, bold = true })

    -- Diffs
    set_hl('DiffAdd',      { bg = colors.diff_add_bg })
    set_hl('DiffChange',   { bg = colors.diff_change_bg })
    set_hl('DiffDelete',   { fg = colors.grey, bg = colors.diff_delete_bg })
    set_hl('DiffText',     { bg = colors.diff_text_bg })

    -- Link to standard groups if needed (e.g., for LSP diagnostics)
    vim.cmd('highlight link DiagnosticError ErrorMsg')
    vim.cmd('highlight link DiagnosticWarn WarningMsg')
    vim.cmd('highlight link DiagnosticInfo Question')
    vim.cmd('highlight link DiagnosticHint Type')
end

-- Assign the function to the module table so it can be called via require
M.apply = ApplyCustomTheme

-- Return the module table
return M
