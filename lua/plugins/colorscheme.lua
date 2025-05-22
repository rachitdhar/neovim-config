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

dark_grey = "#191919"
medium_grey = "#504e4f"
grey = "#b4b3b3"
yellow = "#ffff00"
light_red = "#ff6666"
red = "#FF0000"
dark_red = "#d63232"
orange = "#ffa500"
dim_orange = "#ffae19"
rust_orange = "#cc8400"

bright_green = "#4cff4c"
cyan = "#00ffff"
magenta = "#ff00ff"
console_white = "#F0F0F0"
console_grey = "#d8d8d8"
blue = "#0000e5"


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
	   --[[
		vim.api.nvim_set_hl(0, "StatusLine", {
		  fg = "#000000",    -- foreground text color
		  bg = "#ffdc73",    -- background color
		})
		
		vim.api.nvim_set_hl(0, "StatusLineNC", {
		  fg = "#000000",
		  bg = "#ffdc73",
		})
	   --]]
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
		local selection_bg = "#364f52" 	-- Selection Background
		local comments_text = forest_green 		-- comments, invisibles, line highlighting
		local dark_text_fg = "#4f6568"				-- Dark Foreground (e.g. status bars)
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
	   --[[
		vim.api.nvim_set_hl(0, "StatusLine", {
		  fg = "#000000",    -- foreground text color
		  bg = "#ffdc73",    -- background color
		})
		
		vim.api.nvim_set_hl(0, "StatusLineNC", {
		  fg = "#000000",
		  bg = "#ffdc73",
		})
	   --]]
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

base16_tsoding_minimal = {
	  "https://github.com/RRethy/base16-nvim",
	  config = function()		
		-- all 16 different things in the editor that can be colored
		local default_bg = dark_grey	-- Default Background
		local light_bg = "#363536"		-- Lighter Background (e.g. for status bars, line nr)
		local selection_bg = medium_grey 	-- Selection Background
		local comments_text = rust_orange 		-- comments, invisibles, line highlighting
		local dark_text_fg = "#4f6568"				-- Dark Foreground (e.g. status bars)
		local default_text_fg = ghost_white		-- Default Foreground, Main text color
		local secondary_text_fg = ghost_white	-- Light Foreground (secondary text)
		local highlighted_text_fg = ghost_white	-- Lightest Foreground (e.g. for highlights)
		local variables_color = ghost_white			-- variables, errors, keywords, deletions
		local constants_color = ghost_white		-- constants, numbers
		local types_classes_color = yellow		-- classes, types, special identifiers
		local strings_color = forest_green		-- strings, success indicators
		local special_color = forest_green		-- special text, regex, escape chars
		local functions_color = grey		-- functions, method names, links
		local keywords_color = yellow		-- keywords, declarations, macros
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
	   --[[
		vim.api.nvim_set_hl(0, "StatusLine", {
		  fg = "#000000",    -- foreground text color
		  bg = "#ffdc73",    -- background color
		})
		
		vim.api.nvim_set_hl(0, "StatusLineNC", {
		  fg = "#000000",
		  bg = "#ffdc73",
		})
	   --]]
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

base16_classic_vim = {
	  "https://github.com/RRethy/base16-nvim",
	  config = function()		
		-- all 16 different things in the editor that can be colored
		local default_bg = black	-- Default Background
		local light_bg = dark_grey		-- Lighter Background (e.g. for status bars, line nr)
		local selection_bg = medium_grey 	-- Selection Background
		local comments_text = cyan 		-- comments, invisibles, line highlighting
		local dark_text_fg = medium_grey				-- Dark Foreground (e.g. status bars)
		local default_text_fg = console_grey		-- Default Foreground, Main text color
		local secondary_text_fg = console_grey	-- Light Foreground (secondary text)
		local highlighted_text_fg = console_grey	-- Lightest Foreground (e.g. for highlights)
		local variables_color = console_grey			-- variables, errors, keywords, deletions
		local constants_color = magenta		-- constants, numbers
		local types_classes_color = bright_green		-- classes, types, special identifiers
		local strings_color = magenta		-- strings, success indicators
		local special_color = magenta		-- special text, regex, escape chars
		local functions_color = console_grey		-- functions, method names, links
		local keywords_color = yellow		-- keywords, declarations, macros
		local misc_color = console_grey			-- miscellaneous, deprecated, debug

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
	   --vim.cmd("colorscheme base16")
	   vim.api.nvim_set_hl(0, "@define", { fg = blue, bg = black }) -- For `#define`
		vim.api.nvim_set_hl(0, "@preproc", { fg = blue, bg = black }) -- For general preproc like `#include`
	   --[[
		vim.api.nvim_set_hl(0, "StatusLine", {
		  fg = "#000000",    -- foreground text color
		  bg = "#ffdc73",    -- background color
		})
		
		vim.api.nvim_set_hl(0, "StatusLineNC", {
		  fg = "#000000",
		  bg = "#ffdc73",
		})
	   --]]
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
config_selected = "base16_classic_vim"

if config_selected == "base16_forest" then
	return { base16_forest }
elseif config_selected == "tokyonight" then
	return { tokyonight }
elseif config_selected == "base16_standard" then
	return { base16_standard }
elseif config_selected == "base16_tsoding_minimal" then
	return { base16_tsoding_minimal }
elseif config_selected == "base16_classic_vim" then
	return { base16_classic_vim }
end
