# Using Lazy Plugin Manager and setting up initial File Structure
To use the Lazy plugin manager and configure a well-structured Neovim setup, you can follow these steps. Lazy.nvim is a performant plugin manager for Neovim, allowing you to load plugins efficiently.

### 1. **Install Lazy.nvim**

To start with, install Lazy.nvim:

```bash
git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
```

Then, add Lazy.nvim to your `init.lua` to manage plugins.

### 2. **Setting Up a Neovim File Structure**

A clean and modular file structure will help you keep your Neovim configuration organized and manageable. Here's an example of a good folder structure:

```bash
~/.config/nvim/
├── lua/
│   ├── core/
│   │   ├── init.lua      # Neovim core settings (e.g., keymaps, options)
│   │   ├── keymaps.lua   # Key mappings
│   │   ├── options.lua   # Vim options like tab settings, line numbers
│   ├── plugins/
│   │   ├── init.lua      # Plugin manager setup (Lazy.nvim)
│   │   ├── lsp.lua       # LSP configurations for coding assistance
│   │   ├── treesitter.lua# Treesitter configurations
│   ├── utils/
│   │   ├── init.lua      # Utility functions to be used in other parts of config
├── init.lua              # Main Neovim entry point (loads Lazy.nvim and core settings)
```

### 3. **`init.lua` - Main Entry Point**

Your `init.lua` should load Lazy.nvim and initialize your configurations.

```lua
-- Load Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core")       -- Loads your core settings
require("plugins")    -- Loads your plugins using Lazy.nvim
```

### 4. **`core/init.lua` - Core Settings**

Modularize your Neovim core settings by separating keymaps, options, etc.

```lua
require("core.options")
require("core.keymaps")
```

- `core/options.lua`: Set Neovim options.

```lua
vim.opt.number = true   -- Enable line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.tabstop = 4     -- Set tab width to 4
vim.opt.shiftwidth = 4  -- Indent by 4 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs
```

- `core/keymaps.lua`: Define key mappings.

```lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Keybindings
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
```

### 5. **`plugins/init.lua` - Plugin Management**

In `plugins/init.lua`, you configure Lazy.nvim to load your desired plugins.

```lua
require("lazy").setup({
  -- Example plugins
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',
  -- Add more plugins here
})
```

### 6. **`plugins/lsp.lua` - LSP Setup**

For language server support, configure `nvim-lspconfig`:

```lua
local lspconfig = require('lspconfig')

-- Setup LSP servers
lspconfig.pyright.setup{}  -- Python LSP
lspconfig.tsserver.setup{} -- TypeScript LSP
```

### 7. **`plugins/treesitter.lua` - Treesitter Setup**

Enable syntax highlighting and code parsing using Treesitter:

```lua
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "javascript" },
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
```

### 8. **`utils/init.lua` - Utility Functions**

Define reusable utility functions that can be called across your config files.

```lua
local M = {}

-- Example utility function for keymaps
M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
```

### Additional Tips:

- **Lazy Loading:** Lazy.nvim supports lazy-loading plugins based on events, file types, or keybindings, optimizing startup time. In your plugin list, you can specify when each plugin should load.
  
  Example of lazy loading:
  ```lua
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead', -- Only load when reading a file
  }
  ```

By following this structure and setup, you'll have a highly organized, efficient Neovim configuration powered by Lazy.nvim. You can gradually add more configurations or plugins in a modular way without cluttering your `init.lua`.


# Lazy Loading
Lazy loading in Neovim, especially with plugin managers like Lazy.nvim, refers to the practice of loading plugins only when they are needed, rather than at startup. This speeds up Neovim’s initial load time because plugins are loaded on demand (based on specific conditions like file types, keymaps, commands, etc.) instead of being initialized all at once.

### **Why Lazy Loading?**
- **Improved Startup Time:** Plugins are only loaded when required, reducing the load during startup.
- **Optimized Resource Usage:** Memory and processing power are reserved for when a plugin is actually needed.
- **Cleaner Configuration:** By defining specific triggers for plugin activation, you maintain a more organized and understandable configuration.

### **How Lazy Loading Works in Lazy.nvim**

Lazy.nvim provides several ways to define when a plugin should load. These include:
- **Events:** Load a plugin when a specific Neovim event happens (e.g., `BufRead`, `BufWritePost`).
- **Filetype:** Load a plugin when a specific file type is detected.
- **Keybinding:** Load a plugin when a specific keybinding is pressed.
- **Command:** Load a plugin when a specific command is called.
- **Function:** Load a plugin when a function is executed.
  
### **Examples of Lazy Loading Plugins**

#### **1. Lazy Load on Event**
You can trigger the plugin to load when a particular Neovim event occurs, such as opening a file (`BufRead`).

```lua
{
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',  -- Loads when you open a file
}
```

In this example, Treesitter will only load when a buffer is read (e.g., when you open a file), saving resources when Neovim starts.

#### **2. Lazy Load on File Type**
Some plugins are useful only for specific file types. For example, you might want a Python-specific plugin to load only when editing Python files.

```lua
{
  'psf/black',
  ft = 'python',  -- Loads only when editing Python files
}
```

This loads the `black` Python formatter only when you open a `.py` file.

#### **3. Lazy Load on Keybinding**
You can define keybindings that, when pressed, trigger a plugin to load.

```lua
{
  'nvim-telescope/telescope.nvim',
  keys = { "<leader>ff", "<leader>fg" },  -- Loads when these keybindings are pressed
  config = function()
    require('telescope').setup{}
  end,
}
```

Telescope will load only when you press `<leader>ff` or `<leader>fg`, improving startup performance.

#### **4. Lazy Load on Command**
If you want to load a plugin only when a particular command is run, use the `cmd` key.

```lua
{
  'tpope/vim-fugitive',
  cmd = 'Git',  -- Loads when the `:Git` command is called
}
```

In this case, the `vim-fugitive` plugin will only be loaded when the `:Git` command is invoked.

#### **5. Lazy Load on Function**
You can also lazy load based on specific function calls.

```lua
{
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',  -- Loads when you enter Insert mode
}
```

This will trigger the plugin to load when entering Insert mode, which is perfect for autocompletion plugins like `nvim-cmp`.

### **Combining Multiple Lazy Loading Methods**

You can combine several lazy loading methods for more flexibility. For example, you might want a plugin to load either when a certain keybinding is pressed or when a file of a certain type is opened.

```lua
{
  'preservim/nerdtree',
  keys = { "<leader>n" },  -- Load on keybinding
  cmd = "NERDTreeToggle",  -- Also load on command
  event = "BufWinEnter",   -- Load when a window is opened
}
```

In this example, `NERDTree` will load when pressing `<leader>n`, when the command `:NERDTreeToggle` is called, or when entering a buffer window.

### **Best Practices for Lazy Loading**

1. **Prioritize Heavy Plugins:** Heavy or large plugins (e.g., Telescope, Treesitter, LSP) should be lazily loaded to optimize startup times.
   
2. **Use Events for Common Plugins:** Plugins used frequently but not immediately at startup (like Treesitter for syntax highlighting) can be loaded on `BufRead` or `BufWinEnter` events.

3. **Limit Loading on Filetypes:** Language-specific or tool-specific plugins (e.g., Python formatters or linters) should be lazily loaded based on file types to ensure they don’t affect unrelated workflows.

4. **Command Triggering for Plugins:** Some plugins, such as Git integration or file browsers, are not needed unless specific commands are run. Lazy load them using the `cmd` option.

5. **Keymaps for Common Tools:** For commonly used plugins, bind key combinations to trigger them. For example, binding `<leader>` shortcuts to load navigation or file search plugins like `telescope.nvim` is a good strategy.

6. **Minimal Core Loading:** Keep your core settings and small utility plugins loaded at startup, but defer loading of larger, non-essential plugins until they’re required.

### Example of a Full Setup

Here’s an example of a `plugins/init.lua` that uses Lazy loading effectively:

```lua
require("lazy").setup({
  -- Telescope (file searching), lazy-loaded on keybinding or command
  {
    'nvim-telescope/telescope.nvim',
    keys = { "<leader>ff", "<leader>fg" },
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Treesitter, lazy-loaded when a buffer is opened
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "python", "javascript" },
        highlight = { enable = true },
      }
    end,
  },

  -- LSP, lazy-loaded when entering insert mode (or writing code)
  {
    'neovim/nvim-lspconfig',
    event = 'InsertEnter',
    config = function()
      require('lspconfig').pyright.setup{}
    end,
  },

  -- Python formatter, loaded only for Python files
  {
    'psf/black',
    ft = 'python',
  },
})
```

By following these steps and tips, you can drastically improve the startup time of Neovim while keeping your workflow efficient and modular.