local utils = require('clippy.utils')
local config_path = vim.fn.stdpath("cache")
local running_state_file = string.format("%s/clippy.log", config_path)

---@class ClippyUI
---@field win_id number
---@field win_open boolean
---@field buffer_id number
local ClippyUI = {}

---@return ClippyUI
function ClippyUI:new()
	-- Check wether the window is already open
	if self.win_open then
		return {}
	end

	local width = 30
	local height = 15
	local default_options = {
		relative = "editor",
		style = "minimal",
		border = "single",
		width = 2 * width,
		height = height,
		row = math.floor(((vim.o.lines - height) / 2) - 1),
		col = math.floor((vim.o.columns - 2 * width) / 2),
		zindex = 1000,
		title = "Clippy",
		title_pos = "center",
	}

	-- Creating buffer and window handlers
	local buffer_id = vim.api.nvim_create_buf(false, false)
	local win_id = vim.api.nvim_open_win(buffer_id, false, default_options)

	-- Set the window state to open
	self.win_open = true

	-- Get our cursor to our new floating window
	vim.api.nvim_set_current_win(win_id)

	-- Set wrap + line number
	vim.cmd([[silent set wrap | set nu]])

	self.buffer_id = buffer_id
	self.win_id = win_id

	local file_contents = {}
	local file = io.open(running_state_file, 'r')

	if file then
		-- Write the contents of the file to the file_contents table
		for line in file:lines() do
			table.insert(file_contents, line)
		end

		file_contents = utils.reverse_array(file_contents)

		-- Clear existing lines in the buffer
		vim.api.nvim_buf_set_lines(self.buffer_id, 0, -1, false, {})

		-- Write to our floating window
		vim.api.nvim_buf_set_lines(self.buffer_id, 0, 15, false, file_contents)

		-- Close the file when the loop ends
		file:close()
	end

	return self
end

function ClippyUI:close()
	-- check if it's even open
	if not self.win_open then
		return
	end

	-- Get the contents of the floating window before closing
	local lines = utils.buffer_to_string(self.buffer_id)

	lines = utils.reverse_array(lines)

	local file = io.open(running_state_file, 'w')

	if file then
		-- Keep the last 15 items you yanked
		for line = #lines - 14, #lines do
			if lines[line] then
				file:write(lines[line], '\n')
			end
		end
		file:close()
	end

	-- Deleting buffer and window handlers
	if self.buffer_id ~= nil and vim.api.nvim_buf_is_valid(self.buffer_id) then
		vim.api.nvim_buf_delete(self.buffer_id, { force = true })
	end

	if self.win_id ~= nil and vim.api.nvim_win_is_valid(self.win_id) then
		vim.api.nvim_win_close(self.win_id, true)
	end

	-- Resetting state
	self.win_id = nil
	self.buffer_id = nil
	self.win_open = false
end

function ClippyUI:toggle_menu()
	if self.win_open then
		self:close()
	else
		self:new()
	end
end

return ClippyUI
