vim.g.mapleader = " "                                            -- this means the spacebar is the leader key

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)                    -- convenient file browser transition

vim.keymap.set("n", "<leader>w", ":write<CR>")                   -- convenient write
vim.keymap.set("n", "<leader>q", ":q<CR>")                       -- convenient exit, especially if in a split window you want to close

vim.keymap.set("n", "<leader>s", ":Telescope symbols<CR>")     -- convenient symbol selection

-- tl for terminal latex (% stands for current file)
vim.keymap.set('n', '<leader>tl', function()
    local file = vim.fn.expand('%:t') -- filename only
    local dir = vim.fn.expand('%:p:h') -- directory of the file
    vim.cmd('split')
    vim.cmd('term cd ' .. dir .. ' && pdflatex ' .. file)
end)


-- tp for terminal python. goes to project root, executes python3 -m subdirectory.subdirectory. ... .module
vim.keymap.set('n', '<leader>tp', function()
    -- Get relative file path
    local relpath = vim.fn.expand('%:.') -- relative to CWD, which we assume is the Python project root
    -- Remove .py and replace / with .
    local module_path = relpath:gsub('%.py$', ''):gsub('/', '.')
    -- Open split terminal and run the module
    vim.cmd('split | term python3 -m ' .. module_path)
end)
