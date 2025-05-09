-- to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

-- color pallete
black = "#000000"
deep_blue = "#042428"
coral_red = "#E3BDA3"
aquamarine = "#35C2AE"
violet = "#8A2BE2"
hot_pink = "#FF69B4"
white = "#FFFFFF"
ghost_white = "#F8F8FF"
lavender = "#DFC5FE"
white_blue = "#CEEBF2"
light_green = "#B5E3B1"
forest_green = "#509947"

-- definitions for multiple colorschemes / themes to choose from
tokyonight = {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
}

base16_forest = {
	  "https://github.com/RRethy/base16-nvim",
	  config = function()
		local default_bg = "#052528"	-- Default Background
		local light_bg = "#08383d"		-- Lighter Background (e.g. for status bars, line nr)
		local selection_bg = "#0b4b51" 	-- Selection Background
		local comments_text = "#19974d" 		-- comments, invisibles, line highlighting
		local dark_text_fg = "#3E4451"				-- Dark Foreground (e.g. status bars)
		local default_text_fg = "#e6e6e7"		-- Default Foreground, Main text color
		local secondary_text_fg = "#e6e6e7"	-- Light Foreground (secondary text)
		local highlighted_text_fg = "#FF0000"	-- Lightest Foreground (e.g. for highlights)
		local variables_color = "#e0dad0"			-- variables, errors, keywords, deletions
		local constants_color = "#baebef"		-- constants, numbers
		local types_classes_color = "#a8a66e"		-- classes, types, special identifiers
		local strings_color = "#baebef"		-- strings, success indicators
		local special_color = "#cdf0e4"		-- special text, regex, escape chars
		local functions_color = "#d1c8b8"		-- functions, method names, links
		local keywords_color = "#dadeb3"		-- keywords, declarations, macros
		local misc_color = "#6a696f"			-- miscellaneous, deprecated, debug

	   require("base16-colorscheme").setup({
		base00 = default_bg,
		base01 = light_bg,
		base02 = selection_bg,
		base03 = comments_text,
		base04 = dark_text_fg,
		base05 = default_text_fg,
		base06 = secondary_text_fg,
		base07 = highlighted_text_fg,
		base08 = variables_color,
		base09 = constants_color,
		base0A = types_classes_color,
		base0B = strings_color,
		base0C = special_color,
		base0D = functions_color,
		base0E = keywords_color,
		base0F = misc_color,
	   })
	   -- vim.cmd("colorscheme base16")
	   
		vim.api.nvim_set_hl(0, "StatusLine", {
		  fg = "#000000",    -- foreground text color
		  bg = "#ffdc73",    -- background color
		})
		
		vim.api.nvim_set_hl(0, "StatusLineNC", {
		  fg = "#000000",
		  bg = "#ffdc73",
		})
	   
	   -- immediately disable italics
		vim.defer_fn(function()
		  local groups = {
			"Comment", "TSComment", "TSEmphasis", "Italic",
			"TSConstBuiltin", "TSFuncBuiltin", "TSTypeBuiltin",
			"LspInlayHint", "TreesitterContext"
		  }

		  for _, group in ipairs(groups) do
			local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
			if ok and hl then
			  hl.italic = false
			  vim.api.nvim_set_hl(0, group, hl)
			end
		  end
		end, 50)
	  end,
}

base16_standard = {
	  "https://github.com/RRethy/base16-nvim",
	  config = function()		
		-- all 16 different things in the editor that can be colored
		local default_bg = deep_blue	-- Default Background
		local light_bg = "#1d393d"		-- Lighter Background (e.g. for status bars, line nr)
		local selection_bg = "#4f6568" 	-- Selection Background
		local comments_text = forest_green 		-- comments, invisibles, line highlighting
		local dark_text_fg = "#1d393d"				-- Dark Foreground (e.g. status bars)
		local default_text_fg = ghost_white		-- Default Foreground, Main text color
		local secondary_text_fg = ghost_white	-- Light Foreground (secondary text)
		local highlighted_text_fg = ghost_white	-- Lightest Foreground (e.g. for highlights)
		local variables_color = white_blue			-- variables, errors, keywords, deletions
		local constants_color = coral_red		-- constants, numbers
		local types_classes_color = light_green		-- classes, types, special identifiers
		local strings_color = aquamarine		-- strings, success indicators
		local special_color = hot_pink		-- special text, regex, escape chars
		local functions_color = coral_red		-- functions, method names, links
		local keywords_color = lavender		-- keywords, declarations, macros
		local misc_color = ghost_white			-- miscellaneous, deprecated, debug

	   require("base16-colorscheme").setup({
		base00 = default_bg,
		base01 = light_bg,
		base02 = selection_bg,
		base03 = comments_text,
		base04 = dark_text_fg,
		base05 = default_text_fg,
		base06 = secondary_text_fg,
		base07 = highlighted_text_fg,
		base08 = variables_color,
		base09 = constants_color,
		base0A = types_classes_color,
		base0B = strings_color,
		base0C = special_color,
		base0D = functions_color,
		base0E = keywords_color,
		base0F = misc_color,
	   })
	   -- vim.cmd("colorscheme base16")
	   
		vim.api.nvim_set_hl(0, "StatusLine", {
		  fg = "#000000",    -- foreground text color
		  bg = "#ffdc73",    -- background color
		})
		
		vim.api.nvim_set_hl(0, "StatusLineNC", {
		  fg = "#000000",
		  bg = "#ffdc73",
		})
	   
	   -- immediately disable italics
		vim.defer_fn(function()
		  local groups = {
			"Comment", "TSComment", "TSEmphasis", "Italic",
			"TSConstBuiltin", "TSFuncBuiltin", "TSTypeBuiltin",
			"LspInlayHint", "TreesitterContext"
		  }

		  for _, group in ipairs(groups) do
			local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
			if ok and hl then
			  hl.italic = false
			  vim.api.nvim_set_hl(0, group, hl)
			end
		  end
		end, 50)
	  end,
}

-- select colorscheme
config_selected = "base16_standard"

if config_selected == "base16_forest" then
	return { base16_forest }
elseif config_selected == "tokyonight" then
	return { tokyonight }
elseif config_selected == "base16_standard" then
	return { base16_standard } 
end
