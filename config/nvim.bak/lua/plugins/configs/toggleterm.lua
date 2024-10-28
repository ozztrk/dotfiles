-- lua/plugins/configs/toggleterm.lua
require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    float_opts = {
        border = "curved",
        winblend = 3,
    },
})

