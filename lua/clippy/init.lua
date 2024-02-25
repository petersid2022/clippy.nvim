local ui = require('clippy.ui')
local M = {}

M.setup = function()
	vim.keymap.set({ "n", "i", "v" }, "<C-e>", function() ui:toggle_menu() end)
end

return M
