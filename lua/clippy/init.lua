local M = {}

local ui = require('clippy.ui')
local autocmd = require('clippy.autocmd')

function M.setup()
	vim.keymap.set({ "n", "i", "v" }, "<C-e>", function() ui:toggle_menu() end)
	autocmd:create_autocmd()
end

return M
