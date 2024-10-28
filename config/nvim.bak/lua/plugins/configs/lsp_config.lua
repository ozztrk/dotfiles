require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"ts_ls",
	},
})

local on_attach = function(client)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

    local venv_path = vim.fn.getcwd() .. "/.venv"
    if vim.fn.isdirectory(venv_path) == 1 then
        client.config.settings.python.pythonPath = venv_path .. "/bin/python"
        client.notify("workspace/didChangeConfiguration")
    end

end

-- Define capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the 'vim' global
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
	root_dir = require("lspconfig.util").find_git_ancestor or require("lspconfig.util").path.dirname,
	init_options = {
		python = {
			-- pythonPath = "/path/to/python" -- Manually set the Python interpreter path
			-- venvPath = "./.venv",
			pythonPath = ".venv/bin/python",
		},
	},
	settings = {
		pyright = {
			disableOrganizeImports = true, -- Disable automatic import organization
		},
		python = {
			analysis = {
				typeCheckingMode = "basic", -- Set the type-checking mode to strict
				autoSearchPaths = true, -- Automatically search for paths
				useLibraryCodeForTypes = true, -- Use types from libraries
			},
		},
	},
})
