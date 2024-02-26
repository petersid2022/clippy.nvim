local M = {}

local config_path = vim.fn.stdpath("cache")
local running_state_file = string.format("%s/clippy.log", config_path)

---@param str string
---@return string
local parseText = function(str)
	str = string.gsub(str, "\\n", "\n")
	str = string.gsub(str, "\"", "")
	return str
end

function M:create_autocmd()
	vim.api.nvim_create_augroup("clippy", { clear = true })
	vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
		group = "clippy",
		callback = function()
			-- See :h registers
			local yank = parseText(vim.inspect(vim.fn.getreg('"+')))
			-- Open the file in append/update mode,
			-- where all the previous data is preserved,
			-- and writing is only allowed at the end of file.
			local file = io.open(running_state_file, 'a+')

			if file then
				-- Write the new state
				file:write(yank)

				-- Close the file handler
				file:close()
			end
		end,
	})
end

return M
