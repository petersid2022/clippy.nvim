local ui = require('clippy.ui')
local autocmd = require('clippy.autocmd')
local M = {}

M.setup = function()
	vim.keymap.set({ "n", "i", "v" }, "<C-c>", function() ui:toggle_menu() end)
	autocmd:yank()
end

return M
