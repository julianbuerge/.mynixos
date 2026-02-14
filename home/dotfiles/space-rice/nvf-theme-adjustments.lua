-- coal theme customizations
require("coal").setup({
	colors = {
		-- these are all defined colors
		smoky_black = "#000000",
		eerie_black = "#000000", --'#1A1A1A',
		raisin_black = "#262626",
		dark_charcoal = "#303030", -- this changes the inactive line numbers, active line background
		gray = "#A5A5A5", --'#7E7E7E', active line number, operators, delimiters, comments
		quick_silver = "#AAAAEE", -- "#A5A5A5", --this seems to be key words
		chinese_silver = "#EED0C0", -- "#CCCCCC",
		anti_flash_white = "#EED0C0", -- "#F2F2F2" this changes the statusbar as well as some text -- this seems to be basic text
		white = "#47FF81", --'#FFFFFF', this changes the find results in telescope
	},
})

-- -----------------------------------------------------------------------------
-- Spell checking
vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = blue })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = blue })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = red })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = red })

-- -----------------------------------------------------------------------------
-- Code highlighting customizations
local black = "#000000"
local strong1 = "#FF0059"
local weak1 = "#8899FF"

-- keywords
vim.api.nvim_set_hl(0, "@keyword", { fg = black, bg = weak1, bold = true, italic = true })

-- strings
-- vim.api.nvim_set_hl(0, "@string", { fg = black, bg = strong1 })
-- vim.api.nvim_set_hl(0, "@character", { fg = strong1 })

-- methods
vim.api.nvim_set_hl(0, "@function", { fg = strong1, bold = true })
vim.api.nvim_set_hl(0, "@constructor", { fg = weak1, bold = true })
vim.api.nvim_set_hl(0, "@type.python", { fg = weak1, bold = true })

-- punctuation
-- vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#AAAAEE" })
-- vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#AAAAEE" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#505050" })

-- ---------------------------------------------------------------------------
-- latex
vim.api.nvim_set_hl(0, "@markup.math.latex", { fg = weak1 })

vim.api.nvim_set_hl(0, "@module.latex", { fg = strong1 })
vim.api.nvim_set_hl(0, "@label.latex", { fg = strong1 })

vim.api.nvim_set_hl(0, "@punctuation.bracket.latex", { fg = strong1, bold = false })
vim.api.nvim_set_hl(0, "@punctuation.special.latex", { fg = strong1, bold = false })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.latex", { bg = strong1, fg = black, bold = false })

vim.api.nvim_set_hl(0, "@function.latex", { bg = weak1, fg = black, bold = true })
vim.api.nvim_set_hl(0, "@operator.latex", { fg = strong1, bold = false })

vim.api.nvim_set_hl(0, "@string.latex", { fg = "#EEEEEE" })
