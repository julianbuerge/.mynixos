-- Color definitions
local black = "#000000"
local white = "#EEEEEE"
local comment_gray = "#505050"

local weak1 = "#EED0C0"
local weak2 = "#AAAAEE"
local weak3 = "#E2D0E2"

local strong1 = "#8899FF"
local strong2 = "#FF0059"
local strong3 = "#47FF81"
local strong4 = "#EE8800"

-- coal theme customization
require("coal").setup({
	colors = {
		-- these are all defined colors
		smoky_black = black, -- coal default '#000000'
		eerie_black = black, -- coal default '#1A1A1A'
		raisin_black = "#262626", -- coal default '#262626'
		dark_charcoal = "#303030", -- coal default '#303030'.Inactive line numbers, active line background.
		gray = "7E7E7E", -- coal default '#7E7E7E'. Active line number, operators, delimiters, comments.
		quick_silver = "#A5A5A5", -- coal default '#A5A5A5'. Key words.
		chinese_silver = "#CCCCCC", -- coal default '#CCCCCC'
		anti_flash_white = "#F2F2F2", -- coal default '#F2F2F2' Statusbar, basic text.
		white = strong3, -- coal default '#FFFFFF'. Find results in telescope.
	},
})

-- Spell checking ---------------------------------------------------------------
vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = strong2 })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = strong2 })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = weak3 })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = weak3 })

-- Code highlighting-------------------------------------------------------------
vim.api.nvim_set_hl(0, "@keyword", { fg = black, bg = weak1, bold = true, italic = true })

vim.api.nvim_set_hl(0, "@constructor", { fg = strong1, bold = true })
vim.api.nvim_set_hl(0, "@type.python", { fg = strong1, bold = true })

vim.api.nvim_set_hl(0, "@function", { fg = strong1, bold = true })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = strong4, bold = true })
-- vim.api.nvim_set_hl(0, "@variable.parameter", { fg = weak2, bold = false })

-- vim.api.nvim_set_hl(0, "@operator", { fg = strong4, bold = true })

vim.api.nvim_set_hl(0, "@comment", { fg = comment_gray })

-- Latex----- -------------------------------------------------------------------
vim.api.nvim_set_hl(0, "@markup.math.latex", { fg = weak1 })

vim.api.nvim_set_hl(0, "@module.latex", { fg = strong1 })
vim.api.nvim_set_hl(0, "@label.latex", { fg = strong1 })

vim.api.nvim_set_hl(0, "@punctuation.bracket.latex", { fg = strong1, bold = false })
vim.api.nvim_set_hl(0, "@punctuation.special.latex", { fg = strong1, bold = false })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.latex", { bg = strong1, fg = black, bold = false })

vim.api.nvim_set_hl(0, "@function.latex", { bg = weak1, fg = black, bold = true })
vim.api.nvim_set_hl(0, "@operator.latex", { fg = strong1, bold = false })

vim.api.nvim_set_hl(0, "@string.latex", { fg = white })
