local M = {}

---@param buffer_id integer
---@return string[]
function M.buffer_to_string(buffer_id)
    return vim.api.nvim_buf_get_lines(buffer_id, 0, vim.api.nvim_buf_line_count(buffer_id), false)
end

return M
