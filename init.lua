vim.o.number = true 			-- show line numbers
--vim.o.relativenumber = true 		-- relative line numbers
vim.o.syntax = "on" 			-- enable syntax highlighting
vim.o.mouse = "a" 			-- enable mouse support

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.showmode = false	-- to not show mode (it is already visible on status line)
vim.o.cursorline = true	-- Show which line your cursor is on
vim.o.scrolloff = 10	-- Minimal number of screen lines to keep above and below the cursor.

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

require("config.lazy")			-- for lazy nvim (plugin manager)

-- (space + e) to open file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- (space + f) to find files
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })

-- (space + g) to search files
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- for syntax highlighting
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,  -- Enable Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false,
  },
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})