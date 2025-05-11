return {
	--[[
	{ -- Collection of various small independent plugins/modules
		'echasnovski/mini.nvim',
		config = function()
		  -- Better Around/Inside textobjects
		  --
		  -- Examples:
		  --  - va)  - [V]isually select [A]round [)]paren
		  --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		  --  - ci'  - [C]hange [I]nside [']quote
		  require('mini.ai').setup { n_lines = 500 }

		  -- Add/delete/replace surroundings (brackets, quotes, etc.)
		  --
		  -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		  -- - sd'   - [S]urround [D]elete [']quotes
		  -- - sr)'  - [S]urround [R]eplace [)] [']
		  require('mini.surround').setup()

		  -- Simple and easy statusline.
		  --  You could remove this setup call if you don't like it,
		  --  and try some other statusline plugin
		  local statusline = require 'mini.statusline'
		  -- set use_icons to true if you have a Nerd Font
		  statusline.setup { use_icons = vim.g.have_nerd_font }

		  -- You can configure sections in the statusline by overriding their
		  -- default behavior. For example, here we set the section for
		  -- cursor location to LINE:COLUMN
		  ---@diagnostic disable-next-line: duplicate-set-field
		  statusline.section_location = function()
			return '%2l:%-2v'
		  end

		  -- ... and there is more!
		  --  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
	--]]
	{
	  'nvim-lualine/lualine.nvim',
	  dependencies = { 'nvim-tree/nvim-web-devicons' },
	  config = function()
		require('lualine').setup({
		  options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
		  },
		  sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = {
			  {
				'filename',
				path = 1, -- 0 = filename, 1 = relative path, 2 = absolute path
			  }
			},
			lualine_x = { 'encoding', 'fileformat', 'filetype' },
			lualine_y = {
			  {
				function()
				  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
				  if #clients == 0 then return '' end
				  return 'LSP:' .. clients[1].name
				end,
				icon = '',
			  }
			},
			lualine_z = { 'location' }, -- line:column
		  },
		  inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		  },
		  tabline = {},
		  extensions = {},
		})
	  end
	}
}