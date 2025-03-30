--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move focus to the upper window" })

-- Tabs navigation
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = "New Tab" })
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>', { desc = "Close Tab" })
vim.keymap.set('n', '<leader>tl', ':tabnext<CR>', { desc = "Next Tab" })
vim.keymap.set('n', '<leader>th', ':tabprev<CR>', { desc = "Previous Tab" })


-- [[ Neotree Keymaps ]]
-- vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", { noremap = true, silent = true })


-- [[ Bufferline ]]
-- Switch to the previous buffer
-- vim.keymap.set("n", "<D-M-Left>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
-- Switch to the next buffer
-- vim.keymap.set("n", "<D-M-Right>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })


-- [[ Telescope ]]
-- Find files
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
-- Live grep
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
-- Search buffers
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
-- Delete buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { noremap = true, silent = true }) -- Delete current buffernt = true })


-- [[ Lazygit ]]
vim.keymap.set("n", "<leader>lg", "<cmd>lazygit<CR>", { noremap = true, silent = true })


-- [[ Transparent ]]
vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", { noremap = true, silent = true })


-- [[ Toggleterm ]]
-- Function to open toggle term 1
function _G.open_toggleterm_1()
    require('toggleterm').exec('', 1)
end

-- Function to open toggle term 2
function _G.open_toggleterm_2()
    require('toggleterm').exec('', 2)
end

-- Keybindings to open toggle term 1 and 2
-- vim.api.nvim_set_keymap('n', '<leader>t1', ':lua open_toggleterm_1()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>t2', ':lua open_toggleterm_2()<CR>', { noremap = true, silent = true })

-- Keybinding to close the terminal
vim.api.nvim_set_keymap('n', '<leader>ct', ':ToggleTermToggleAll<CR>', { noremap = true, silent = true })

-- [[ Harpoon ]]
-- Navigate to file 1, 2, 3, etc. in Harpoon
vim.api.nvim_set_keymap('n', '<leader>1', [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', [[<cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true })

-- Toggle the Harpoon UI menu
vim.api.nvim_set_keymap('n', '<leader>e', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true, silent = true })

-- Add current file to Harpoon
vim.api.nvim_set_keymap('n', '<leader>a', [[<cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true })

-- Send commands to tmux windows
vim.api.nvim_set_keymap('n', '<leader>t1', [[<cmd>lua require("harpoon.tmux").sendCommand(1, "echo 'Hello World!'")<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t2', [[<cmd>lua require("harpoon.tmux").sendCommand(2, "ls")<CR>]], { noremap = true, silent = true })

-- Switch to a specific tmux window
vim.api.nvim_set_keymap('n', '<leader>g1', [[<cmd>lua require("harpoon.tmux").gotoTerminal(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g2', [[<cmd>lua require("harpoon.tmux").gotoTerminal(2)<CR>]], { noremap = true, silent = true })


-- [[ Trouble ]]
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
