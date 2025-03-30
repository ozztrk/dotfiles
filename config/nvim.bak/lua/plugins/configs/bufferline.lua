vim.opt.termguicolors = true
local bufferline = require("bufferline")
bufferline.setup({
	options = {
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		diagnostics = "nvim-lsp",
		offsets = {
			{
				filetype = "neo-tree", -- Ensure this is the correct filetype for NeoTree
				text = "File Explorer",
				text_align = "center", -- Align the text to "left", "center", or "right"
				separator = true, -- Add a separator between NeoTree and the bufferline
			},
		},
	},
})
