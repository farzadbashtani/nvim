-- Force transparent backgrounds and preserve selection highlight in file explorers
-- Loaded at the end of init.lua via require("plugins.ui.transparent")

local transparent_groups = {
	"Normal", "NormalNC", "NormalFloat", "SignColumn", "LineNr", "CursorLineNr", "CursorLine", "ColorColumn",
	"VertSplit", "WinSeparator", "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "TabLineSel",
	"Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb", "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
	"TelescopePromptBorder", "TelescopeResultsNormal", "TelescopePreviewNormal", "FloatBorder", "FloatTitle",
	"EndOfBuffer", "Folded", "FoldColumn", "NvimTreeNormal", "NeoTreeNormal", "WhichKeyFloat", "CmpDocumentation",
	"CmpDocBorder", "CmpPmenu",
}

local function set_selection_highlights()
	-- keep selected row bg untouched so theme/plugin can provide visible selection
	local fg
	local ok, hl = pcall(vim.api.nvim_get_hl_by_name, "CursorLineNr", true)
	if ok and hl and hl.foreground then
		fg = string.format("#%06x", hl.foreground)
	end
	local sel_groups = { "NeoTreeCursorLine", "NvimTreeCursorLine", "ExplorerCursorLine", "NeoTreeHighlight", "NeoTreeFloatBorder" }
	for _, g in ipairs(sel_groups) do
		if fg then
			pcall(vim.api.nvim_set_hl, 0, g, { fg = fg, bold = true })
		else
			pcall(vim.api.nvim_set_hl, 0, g, { bold = true })
		end
	end
end

local function set_transparent()
	for _, g in ipairs(transparent_groups) do
		pcall(vim.api.nvim_set_hl, 0, g, { bg = "none" })
	end
	-- ensure selection in side panels remains visible
	set_selection_highlights()
end

-- apply now
set_transparent()
-- reapply when colorscheme or windows change (plugins may reset highlights)
local group = vim.api.nvim_create_augroup("ForceTransparentBg", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = set_transparent })
vim.api.nvim_create_autocmd("BufWinEnter", { group = group, callback = set_transparent })
vim.api.nvim_create_autocmd("VimResized", { group = group, callback = set_transparent })

return {}