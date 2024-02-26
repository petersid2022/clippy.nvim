local autocmd = {}
local config_path = vim.fn.stdpath("cache")
local running_state_file = string.format("%s/clippy.log", config_path)

---@param str string
---@return string
local parseText = function(str)
	-- Match any type of newline
    local pattern = "[\\r\\n\\u{2028}\\u{2029}]+"
    str = string.gsub(str, pattern, "")
    str = string.gsub(str, "\"", "")
    return str
end

function autocmd:yank()
	vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
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

return autocmd
