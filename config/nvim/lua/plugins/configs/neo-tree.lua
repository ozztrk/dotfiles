-- Init.lua or your custom config file for Neovim (Chat GPT)
require("neo-tree").setup({
	close_if_last_window = true, -- Close NeoTree if it's the last window left open
	popup_border_style = "rounded", -- Border for popups
	enable_git_status = true, -- Show git status in the tree
	enable_diagnostics = true, -- Show LSP diagnostics in the tree
	filesystem = {
          follow_current_file = {
            enabled = false, -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
		use_libuv_file_watcher = true, -- Auto-refresh tree when files change
	},
	buffers = {
		show_unloaded = true, -- Show buffers that aren't currently loaded
	},
	window = {
		position = "left", -- Position the tree on the left
		width = 30, -- Set tree width
		mappings = {
			["<space>"] = "toggle_node", -- Expand/Collapse folders
			["<cr>"] = "open", -- Open file
			["<Cmd-b>"] = "close_window", -- Custom keymap: Close NeoTree with Cmd + b
			["s"] = "split_with_window_picker", -- Split horizontally
			["v"] = "vsplit_with_window_picker", -- Split vertically
		},
	},
	default_component_configs = {
		git_status = {
			symbols = {
				-- Change symbols for git status
				added = "✚",
				modified = "",
				deleted = "✖",
				renamed = "",
				untracked = "",
			},
		},
	},
})
