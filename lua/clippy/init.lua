local M = {}

local ui = require('clippy.ui')
local autocmd = require('clippy.autocmd')

function M.setup()
	vim.keymap.set({ "n", "i", "v" }, "<C-e>", function() ui:toggle_menu() end)
	autocmd:yank()
end

return M
