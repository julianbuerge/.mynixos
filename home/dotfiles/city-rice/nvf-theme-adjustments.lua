-- coal theme customizations
require("coal").setup({
	colors = {
		-- these are all defined colors
		smoky_black = "#000000",
		eerie_black = "#1A1A1A",
		raisin_black = "#262626",
		dark_charcoal = "#000000", -- this changes the inactive line numbers, active line background
		gray = "#A5A5A5", --'#7E7E7E', active line number, operators, delimiters, comments
		quick_silver = "#A5A5A5", --this seems to be key words
		chinese_silver = "#CCCCCC", -- this seems to be basic text
		anti_flash_white = "#F2F2F2", -- this changes the statusbar as well as some text
		white = "#47FF81", --'#FFFFFF', this changes the find results in telescope
	},
})

-- -----------------------------------------------------------------------------
-- Spell checking
vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#FF0059" })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#FF0059" })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "#FFFFE0" })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "#FFFFE0" })

-- -----------------------------------------------------------------------------
-- Code highlighting customizations
local black = "#000000"
local strong1 = "#4beed0"
local weak1 = "#4b9eff"

-- keywords
vim.api.nvim_set_hl(0, "@keyword", { fg = black, bg = weak1, bold = true, italic = true })

-- methods
vim.api.nvim_set_hl(0, "@function", { fg = strong1, bold = true })
vim.api.nvim_set_hl(0, "@constructor", { fg = strong1, bold = true })
vim.api.nvim_set_hl(0, "@type.python", { fg = weak1, bold = true })

-- comments
vim.api.nvim_set_hl(0, "@comment", { fg = "#a0a0a0" })

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

vim.api.nvim_set_hl(0, "@string.latex", { fg = "#FFFFFF" })
