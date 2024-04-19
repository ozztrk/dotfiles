--nvim/lua/pluginlist.lua

return {
	
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}
